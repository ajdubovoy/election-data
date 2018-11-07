class AddRejectedOtherToCounties < ActiveRecord::Migration[5.2]
  def change
    add_column :counties, :rejected_other, :int
  end
end
