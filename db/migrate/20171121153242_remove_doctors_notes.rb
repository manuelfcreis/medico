class RemoveDoctorsNotes < ActiveRecord::Migration[5.1]
  def change
    remove_reference :prescriptions, :doctors_note
    add_reference :prescriptions, :appointment, index: true
    drop_table :doctors_notes
 end
end
