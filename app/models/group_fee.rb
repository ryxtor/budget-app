class GroupFee < ApplicationRecord
  belongs_to :group, foreign_key: 'group_id', class_name: 'Group'
  belongs_to :fee, foreign_key: 'fee_id', class_name: 'Fee'
end
