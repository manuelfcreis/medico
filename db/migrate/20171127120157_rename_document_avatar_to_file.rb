class RenameDocumentAvatarToFile < ActiveRecord::Migration[5.1]
  def change
  	rename_column :documents, :avatar, :file
  end
end
