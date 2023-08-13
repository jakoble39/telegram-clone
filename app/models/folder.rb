# frozen_string_literal: true

class Folder < ApplicationRecord
  belongs_to :user
  has_many :chat_folders
  has_many :chats, through: :chat_folders
end
