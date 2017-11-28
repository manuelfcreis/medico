class ChangeTypeSymptoms < ActiveRecord::Migration[5.1]
  def change
    rename_column :symptoms, :type, :classification
  end
end
