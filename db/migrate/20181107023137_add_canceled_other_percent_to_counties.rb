class AddCanceledOtherPercentToCounties < ActiveRecord::Migration[5.2]
  def change
    add_column :counties, :canceled_other_percent, :int
  end
end
