class AddModemToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :modem, :boolean
  end
end
