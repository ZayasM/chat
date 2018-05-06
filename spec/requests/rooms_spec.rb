require 'rails_helper'

RSpec.describe 'rooms API', type: :request do
  let!(:rooms) { create_list(:room, 10) }
  let(:room_id) { Room.first.id.to_s }

  describe 'GET /rooms' do
    before { get '/rooms' }

    it 'returns rooms' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end

  describe 'POST /rooms' do
    context 'when the request is valid' do
      let!(:valid_attributes) { { name: 'Rivendel'} }

      before { post '/rooms', params: valid_attributes }

      it 'creates a room' do
        expect(json['name']).to eq('Rivendel')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      it 'returns a validation failure message' do
        expect{ post '/rooms', params: {   name: ''} }.to raise_error(Mongoid::Errors::Validations,
        /The following errors were found: Name can't be blank/)
      end
    end
  end

  describe 'GET /rooms/:id' do
    context 'when the request is valid' do
      before { get "/rooms/#{room_id}" }

      it 'returns the room' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(room_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      it 'returns a not found message' do
        expect{ get '/rooms/100'}.to raise_error(Mongoid::Errors::DocumentNotFound)
     end
    end

  end

end
