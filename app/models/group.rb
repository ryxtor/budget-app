class Group < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  has_many :group_fees, foreign_key: 'group_id', class_name: 'GroupFee', dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 50 }
  validates :icon, presence: true
end
