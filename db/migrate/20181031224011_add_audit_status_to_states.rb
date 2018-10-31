class AddAuditStatusToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :audit_status, :string
  end
end
