class AddDocsToDocuments < ActiveRecord::Migration[5.1]
  def change
    add_column :documents, :avatar, :string
  end
end
