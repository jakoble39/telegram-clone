# frozen_string_literal: true

module Types
  class ChatType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :type, Types::ChatTypeType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
