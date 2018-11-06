class AddRegistrationInnovationToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :registration_innovation, :string
  end
end
