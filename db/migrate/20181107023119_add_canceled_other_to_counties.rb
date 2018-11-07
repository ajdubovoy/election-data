class AddCanceledOtherToCounties < ActiveRecord::Migration[5.2]
  def change
    add_column :counties, :canceled_other, :int
  end
end
