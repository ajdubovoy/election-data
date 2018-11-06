class AddVoterIdToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :voter_id, :string
  end
end
