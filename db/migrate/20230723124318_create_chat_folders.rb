class CreateChatFolders < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_folders do |t|
      t.references :chat, null: false, foreign_key: true, index: true
      t.references :folder, null: false, foreign_key: true, index: true
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
