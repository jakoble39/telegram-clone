# frozen_string_literal: true

class CreateFolders < ActiveRecord::Migration[7.0]
  def change
    create_table :folders do |t|
      t.string :name, null: false, limit: 100
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
