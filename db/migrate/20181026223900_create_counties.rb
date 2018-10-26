class CreateCounties < ActiveRecord::Migration[5.2]
  def change
    create_table :counties, id: false do |t|
      t.primary_key :fips
      t.references :state
      t.string :name
      t.integer :equipment_age
      t.string :paper_status

      t.timestamps
    end
  end
end
