# frozen_string_literal: true

class Chat < ApplicationRecord
  has_many :chat_folders
  has_many :folders, through: :chat_folders
  has_many :chat_participants
  has_many :users, through: :chat_participants
  has_many :chat_messages

  enum type: { direct: 0, room: 1, channel: 2 }
end
