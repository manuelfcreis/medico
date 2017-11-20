class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescriptions do |t|
      t.references :doctors_note, foreign_key: true

      t.timestamps
    end
  end
end
