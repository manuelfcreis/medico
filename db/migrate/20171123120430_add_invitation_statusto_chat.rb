class AddInvitationStatustoChat < ActiveRecord::Migration[5.1]
  def change
    add_column :chats, :accepted, :boolean, :default => false
  end
end
