class AddCanceledRegistrationsToCounties < ActiveRecord::Migration[5.2]
  def change
    add_column :counties, :canceled_registrations, :int
  end
end
