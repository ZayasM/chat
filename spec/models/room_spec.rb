require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:room) { create(:room)}
  let(:invalidRoom) {build(:room)}

  it "has a valid factory" do
    expect(room).to be_valid
  end

  it "has a present name" do
    invalidRoom.name = nil;
    expect(invalidRoom).to be_invalid
  end

  it "has a unique name" do
    invalidRoom.name = room.name;
    expect(invalidRoom).to be_invalid
  end

end
