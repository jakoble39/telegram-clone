# frozen_string_literal: true

module Types
  class ChatTypeType < BaseEnum
    value 'DIRECT', 'Direct Chat', value: 0
    value 'ROOM', 'Room Chat', value: 1
    value 'CHANNEL', 'Channel Chat', value: 2
  end
end
