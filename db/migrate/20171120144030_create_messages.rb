class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :sender
      t.references :chatroom, foreign_key: true

      t.timestamps
    end
  end
end
