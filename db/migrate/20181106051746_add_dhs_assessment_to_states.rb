class AddDhsAssessmentToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :dhs_assessment, :boolean
  end
end
