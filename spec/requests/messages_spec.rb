require 'rails_helper'

RSpec.describe 'messages API', type: :request do
  let(:room) { create(:room)}
  let(:room_id) { Room.first.id.to_s }
  let(:user) { create(:user) }
  let!(:messages) { create_list(:message, 10,  user_id: user.id, room_id: room.id) }

  describe 'GET /rooms/:room_id/messsages' do
    before { get "/rooms/#{room_id}/messages" }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns all todo messages' do
      expect(json.size).to eq(10)
    end

  end

end
