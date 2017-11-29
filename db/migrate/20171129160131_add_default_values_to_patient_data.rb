class AddDefaultValuesToPatientData < ActiveRecord::Migration[5.1]
  def change
    change_column :patients, :sex, :string, default: "N/A"
    change_column :patients, :bloodtype, :string, default: "N/A"
    change_column :patients, :education, :string, default: "N/A"
    change_column :patients, :marital_status, :string, default: "N/A"
    change_column :patients, :occupation, :string, default: "N/A"
    change_column :patients, :disability, :string, default: "N/A"
    change_column :patients, :religion, :string, default: "N/A"
  end
end
