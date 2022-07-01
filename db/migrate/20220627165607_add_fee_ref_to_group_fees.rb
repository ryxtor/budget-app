class AddFeeRefToGroupFees < ActiveRecord::Migration[7.0]
  def change
    add_reference :group_fees, :fee, null: false, foreign_key: true
  end
end
