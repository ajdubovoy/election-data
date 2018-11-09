class ChangeDataTypeForRejectedOther < ActiveRecord::Migration[5.2]
  def change
    change_table :counties do |t|
      t.change :canceled_other_percent, :numeric
    end
  end
end
