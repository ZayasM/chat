require 'rails_helper'

RSpec.describe 'Users API', type: :request do

  describe 'POST /users' do

    context 'when the request is valid' do
      let!(:valid_attributes) { { nick: 'Gandalf'} }

      before { post '/users', params: valid_attributes }

      it 'creates a user' do
        expect(json['nick']).to eq('Gandalf')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do

      it 'returns a validation failure message' do
        expect{ post '/users', params: {   nick: ''} }.to raise_error(Mongoid::Errors::Validations,
        /The following errors were found: Nick can't be blank/)
      end

    end

  end

end
