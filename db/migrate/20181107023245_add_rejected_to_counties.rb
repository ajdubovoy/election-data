class AddRejectedToCounties < ActiveRecord::Migration[5.2]
  def change
    add_column :counties, :rejected, :int
  end
end
