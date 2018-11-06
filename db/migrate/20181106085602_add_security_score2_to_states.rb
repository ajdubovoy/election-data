class AddSecurityScore2ToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :security_score_2, :int
  end
end
