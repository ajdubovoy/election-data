class AddTossUpsToCounties < ActiveRecord::Migration[5.2]
  def change
    add_column :counties, :toss_ups, :string
  end
end
