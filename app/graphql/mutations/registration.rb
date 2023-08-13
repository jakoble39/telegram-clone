# frozen_string_literal: true

module Mutations
  class Registration < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
    argument :name, String, required: true

    type Types::SessionType

    def resolve(email:, password:, password_confirmation:, name:)
      user = User.create(email:, password:, password_confirmation:, name:)
      raise GraphQL::ExecutionError, user.errors.full_messages if user.errors.any?

      Session::User.find_or_create(user_id: user.id)
    end
  end
end
