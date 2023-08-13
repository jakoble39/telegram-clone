module Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    private

    def current_user
      context[:current_user]
    end

    def authenticate_user!
      return if current_user.present?

      raise GraphQL::ExecutionError, 'Authentication required'
    end
  end
end
