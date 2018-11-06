class AddSecurityScoreToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :security_score, :int
  end
end
