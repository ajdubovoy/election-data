class CreateCounties < ActiveRecord::Migration[5.2]
  def change
    create_table :counties do |t|
      t.primary_key, :fips
      t.references, :state
      t.int, :county
      t.string, :name
      t.int, :equipment_age
      t.string :paper_status

      t.timestamps
    end
  end
end
