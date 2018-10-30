class CreateMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :machines do |t|
      t.references :county, foreign_key: true
      t.string :make
      t.string :model
      t.string :type

      t.timestamps
    end
  end
end
