# frozen_string_literal: true

module Types
  class SessionType < Types::BaseObject
    field :user, Types::UserType, null: false
    field :auth_token, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
