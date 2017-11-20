class CreateMedications < ActiveRecord::Migration[5.1]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :ingredient
      t.string :format
      t.integer :avg_dose
      t.string :unit
      t.integer :package_size
      t.float :price
      t.boolean :generic

      t.timestamps
    end
  end
end
