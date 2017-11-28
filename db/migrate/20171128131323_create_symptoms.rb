class CreateSymptoms < ActiveRecord::Migration[5.1]
  def change
    create_table :symptoms do |t|
      t.string :name
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
