# frozen_string_literal: true

class ChatFolder < ApplicationRecord
  belongs_to :folder
  belongs_to :chat
end
