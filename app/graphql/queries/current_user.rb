# frozen_string_literal: true

module Queries
  class CurrentUser < Queries::BaseQuery
    type ::Types::UserType, null: true
    description 'Retrieve the currently authenticated user'

    def resolve
      context[:current_user]
    end
  end
end

