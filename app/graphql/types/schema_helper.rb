# frozen_string_literal: true

module Types
  module SchemaHelper
    include ActiveSupport::Concern

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods

      # Automatically register all mutations or queries who inherit from the base mutation or query
      def auto_register_routes(type)
        type_module = type.constantize
        type_module.constants.each do |klass|
          klass = type_module.const_get(klass)
          next unless klass.superclass == "#{type}::Base#{type.singularize}".constantize

          klass_name = klass.name.demodulize
          field klass_name.underscore, resolver: klass
        end
      end
    end
  end
end
