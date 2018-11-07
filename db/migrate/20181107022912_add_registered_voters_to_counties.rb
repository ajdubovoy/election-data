class AddRegisteredVotersToCounties < ActiveRecord::Migration[5.2]
  def change
    add_column :counties, :registered_voters, :int
  end
end
