class AddLinkToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :link, :text
  end
end
