class AddFileTypeToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :file_type, :string
  end
end
