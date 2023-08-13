# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :folders
  has_many :chat_participants
  has_many :chats, through: :chat_participants

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 100 }

  validates :password_digest, presence: true, length: { maximum: 100 }
end
