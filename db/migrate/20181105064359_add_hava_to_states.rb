class AddHavaToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :hava, :int
  end
end
