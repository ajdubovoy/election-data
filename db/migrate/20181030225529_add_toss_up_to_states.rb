class AddTossUpToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :toss_up, :string
  end
end
