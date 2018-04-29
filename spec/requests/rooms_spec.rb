require 'rails_helper'

RSpec.describe Message, type: :request do
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
    let!(:valid_attributes) { { name: 'Rivendel'} }

    before { post '/rooms', params: valid_attributes }

    it 'creates a room' do
      expect(json['name']).to eq('Rivendel')
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end

  end

  describe 'GET /rooms/:id' do
    before { get "/rooms/#{room_id}" }

    it 'returns the room' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(room_id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end

end
