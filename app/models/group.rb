class Group < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  has_many :group_fees, foreign_key: 'group_id', class_name: 'GroupFee', dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 50 }
  validates :name, format: { with: /\A[a-zA-Z0-9_]+\z/ }
  validates :icon, presence: true
  validates :total_amount, presence: true
  validates :total_amount, numericality: { greater_than_or_equal_to: 0 }
end
