# frozen_string_literal: true

module Types
  class ChatMessageType < Types::BaseObject
    field :id, ID, null: false
    field :chat_id, Integer, null: false
    field :user_id, Integer, null: false
    field :content, String, null: false
    field :read_at, GraphQL::Types::ISO8601DateTime
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
