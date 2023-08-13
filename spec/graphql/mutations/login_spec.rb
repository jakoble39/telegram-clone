# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::Login, type: :request do
  let!(:user) { create(:user, password: 'test') }
  let(:query) do
    <<~GQL
      mutation($email: String!, $password: String!) {
        login(email: $email, password: $password) {
          user {
            id
          }
          authToken
        }
      }
    GQL
  end

  context 'when the credentials are valid' do
    let!(:variables) do
      {
        email: user.email,
        password: 'test'
      }
    end

    it 'returns the user and auth token' do
      expect { post '/graphql', params: { query:, variables: } }.to change { Session::User.count }.by(1)

      json = JSON.parse(response.body)
      data = json['data']['login']

      expect(data['user']['id']).to eq(user.id.to_s)
      expect(data['authToken']).to be_present
    end
  end

  context 'when the credentials are invalid' do
    let!(:variables) do
      {
        email: user.email,
        password: 'invalid'
      }
    end

    it 'returns an error' do
      expect { post '/graphql', params: { query:, variables: } }.to change { Session::User.count }.by(0)

      json = JSON.parse(response.body)
      errors = json['errors']

      expect(errors).to be_present
    end
  end
end
