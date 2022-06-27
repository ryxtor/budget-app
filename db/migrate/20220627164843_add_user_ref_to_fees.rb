class AddUserRefToFees < ActiveRecord::Migration[7.0]
  def change
    add_reference :fees, :user, null: false, foreign_key: true
  end
end
