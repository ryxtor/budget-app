class Fee < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  has_many :group_fees, foreign_key: 'fee_id', class_name: 'GroupFee', dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
