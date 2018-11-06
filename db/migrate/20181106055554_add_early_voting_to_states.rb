class AddEarlyVotingToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :early_voting, :string
  end
end
