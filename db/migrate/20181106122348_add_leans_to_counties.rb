class AddLeansToCounties < ActiveRecord::Migration[5.2]
  def change
    add_column :counties, :leans, :string
  end
end
