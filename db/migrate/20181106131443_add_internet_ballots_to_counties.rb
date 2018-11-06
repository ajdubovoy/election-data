class AddInternetBallotsToCounties < ActiveRecord::Migration[5.2]
  def change
    add_column :counties, :internet_ballots, :string
  end
end
