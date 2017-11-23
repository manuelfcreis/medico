class AddNameAndDescriptionToDocuments < ActiveRecord::Migration[5.1]
  def change
    add_column :documents, :name, :string
    add_column :documents, :description, :text
  end
end
