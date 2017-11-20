class CreateDoses < ActiveRecord::Migration[5.1]
  def change
    create_table :doses do |t|
      t.references :medication, foreign_key: true
      t.references :prescription, foreign_key: true
      t.integer :days
      t.integer :frequency
      t.integer :quantity
      t.text :description

      t.timestamps
    end
  end
end
