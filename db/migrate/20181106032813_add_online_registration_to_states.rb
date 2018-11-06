class AddOnlineRegistrationToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :online_registration, :boolean
  end
end
