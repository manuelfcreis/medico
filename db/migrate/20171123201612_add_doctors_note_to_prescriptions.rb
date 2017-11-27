class AddDoctorsNoteToPrescriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :prescriptions, :doctors_notes, :text
  end
end
