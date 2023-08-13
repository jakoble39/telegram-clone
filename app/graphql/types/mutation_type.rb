# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    include SchemaHelper

    auto_register_routes('Mutations')
  end
end
