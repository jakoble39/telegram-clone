# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Queries::CurrentUser, type: :request do
  let!(:user) { create(:user) }
  let(:query) do
    <<~GQL
        query {
          currentUser {
            id
          }
      }
    GQL
  end

  context 'when the user is authenticated' do
    let(:session) { Session::User.create!(user_id: user.id) }

    it 'returns the current user' do
      post '/graphql', params: { query: }, headers: { 'Authorization' => "Bearer #{session.auth_token}" }

      json = JSON.parse(response.body)
      data = json['data']['currentUser']

      expect(data['id']).to eq(user.id.to_s)
    end
  end

  context 'when the user is not authenticated' do
    it 'returns an error' do
      post '/graphql', params: { query: }

      json = JSON.parse(response.body)
      data = json['data']['currentUser']

      expect(data).to be_nil
    end
  end
end
