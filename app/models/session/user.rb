# frozen_string_literal: true

module Session
  class User < T::Struct
    include Redcord::Base

    ttl 2.hours

    attribute :user_id, Integer, index: true
    attribute :auth_token, String, index: true

    def user
      @user ||= ::User.find(user_id)
    end

    class << self
      def find_or_create(attributes)
        find_by(attributes) || create!(attributes)
      end

      def create!(attributes)
        attributes[:auth_token] ||= SecureRandom.uuid
        super(attributes)
      end
    end
  end
end
