require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:user) { create(:user) }
  let(:room) { create(:room) }
  let!(:message) { create( :message, user_id: user.id, room_id: room.id ) }
  let!(:invalidMessage) { build(:message, user_id: user.id, room_id: room.id)}

  it "has a valid factory" do
    expect(message).to be_valid
  end

  it "is mongoid document" do
    is_expected.to be_mongoid_document
  end

  it "has a Timestamps" do
    is_expected.to have_timestamps
  end

  describe 'validate text' do

    it 'has a present text' do
      invalidMessage.text = nil
      invalidMessage.valid?
      expect(invalidMessage.errors[:text]).to include("can't be blank")
    end

    it "text is type String" do
      is_expected.to have_field(:text).of_type(String)
    end

  end

  it "has a relation N-1 with room" do
    is_expected.to belong_to :room
  end

  it "has a relation N-1 with user" do
    is_expected.to belong_to :user
  end

end
