class AddStatusToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :status, :string, default: "pending"
  end
end
