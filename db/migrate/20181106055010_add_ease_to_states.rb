class AddEaseToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :ease, :string
  end
end
