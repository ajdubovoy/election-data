class AddTossUpToCounties < ActiveRecord::Migration[5.2]
  def change
    add_column :counties, :toss_up, :string
  end
end
