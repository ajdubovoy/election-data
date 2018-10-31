class AddPopulationToCounties < ActiveRecord::Migration[5.2]
  def change
    add_column :counties, :population, :int
  end
end
