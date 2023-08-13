# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::Registration, type: :request do
  let(:query) do
    <<~GQL
      mutation($email: String!, $password: String!, $passwordConfirmation: String!, $name: String!) {
        registration(email: $email, password: $password, passwordConfirmation: $passwordConfirmation, name: $name) {
          user {
            id
          }
          authToken
        }
      }
    GQL
  end

  context 'when params are valid' do
    let!(:variables) do
      {
        email: 'email@example.com',
        password: 'test',
        passwordConfirmation: 'test',
        name: 'test'
      }
    end

    it 'returns the user and auth token' do
      expect { post '/graphql', params: { query:, variables: } }.to change { User.count }.by(1)

      json = JSON.parse(response.body)
      data = json['data']['registration']

      expect(data['user']['id']).to be_present
      expect(data['authToken']).to be_present
    end
  end

  context 'when params are not valid' do
    let!(:variables) do
      {
        email: 'email@example.com',
        password: 'test',
        passwordConfirmation: 'wrong',
        name: 'test'
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
