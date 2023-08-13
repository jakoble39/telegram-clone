# frozen_string_literal: true

module Mutations
  class Login < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    type Types::SessionType

    def resolve(email:, password:)
      user = User.find_by(email:)
      raise GraphQL::ExecutionError, 'Invalid email or password' unless user&.authenticate(password)

      Session::User.find_or_create(user_id: user.id)
    end
  end
end
