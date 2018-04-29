require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:user) { create(:user) }
  let(:room) { create(:room) }
  let!(:message) { create( :message, user_id: user.id, room_id: room.id ) }

  it "has a valid factory" do
    expect(message).to be_valid
  end

  it 'has a present name' do
    message.text = nil
    expect(message).to be_invalid
  end

end
