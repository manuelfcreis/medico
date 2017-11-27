class AddNotesToPrescriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :notes, :text
  end
end
