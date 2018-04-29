require 'rails_helper'

RSpec.describe Message, type: :request do

  describe 'POST /users' do
    let!(:valid_attributes) { { nick: 'Gandalf'} }

    before { post '/users', params: valid_attributes }

    it 'creates a user' do
      expect(json['nick']).to eq('Gandalf')
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end

  end

end
