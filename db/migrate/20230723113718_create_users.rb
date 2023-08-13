# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 100
      t.string :email, null: false, limit: 100
      t.string :password_digest, null: false, limit: 100

      t.timestamps
    end
  end
end
