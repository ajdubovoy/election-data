class CreateMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :machines do |t|
      t.references :county
      t.string :make
      t.string :model
      t.string :category

      t.timestamps
    end
  end
end
