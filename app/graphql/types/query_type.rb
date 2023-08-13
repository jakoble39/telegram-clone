# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include SchemaHelper

    auto_register_routes('Queries')
  end
end
