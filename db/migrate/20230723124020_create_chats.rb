# frozen_string_literal: true

class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.string :name, null: true, limit: 100
      t.integer :type, null: false, default: 0, limit: 1 # 0: direct, 1: group, 2: channel

      t.timestamps
    end
  end
end
