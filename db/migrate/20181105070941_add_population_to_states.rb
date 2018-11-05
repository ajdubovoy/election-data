class AddPopulationToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :population, :int
  end
end
