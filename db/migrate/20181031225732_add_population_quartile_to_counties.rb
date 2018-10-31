class AddPopulationQuartileToCounties < ActiveRecord::Migration[5.2]
  def change
    add_column :counties, :population_quartile, :int
  end
end
