class CreateDoctorsNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors_notes do |t|
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
