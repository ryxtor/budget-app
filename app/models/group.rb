class Group < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  has_many :group_fees, foreign_key: 'group_id', class_name: 'GroupFee', dependent: :destroy

  validates :name, presence: true
  validates :name, length: { maximum: 50 }
  validates :icon, presence: true

  def total_amount
    # fees = group_fees.includes([:fee]).map(&:fee_id)
    # fees.inject(0) { |sum, fee| sum + Fee.find(fee).amount }
    fees = group_fees.includes([:fee])
    total = 0
    fees.each do |fee|
      total += fee.fee.amount
    end
    total
  end
end
