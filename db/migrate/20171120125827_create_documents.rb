class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.references :uploader, polymorphic: true, index: true

      t.timestamps
    end
  end
end
