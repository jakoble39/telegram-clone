class CreateChatMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_messages do |t|
      t.references :chat, null: false, foreign_key: true, index: true
      t.references :user, null: false, foreign_key: true, index: true
      t.text :content, null: false, limit: 1000
      t.datetime :read_at, null: true

      t.timestamps
    end
  end
end
