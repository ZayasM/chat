require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:room) { create(:room)}
  let(:invalidRoom) {build(:room)}

  it "has a valid factory" do
    expect(room).to be_valid
  end

  it "has a present name" do
    invalidRoom.name = nil;
    invalidRoom.valid?
    expect(invalidRoom.errors[:name]).to include("can't be blank")
  end

  it "has a unique name" do
    invalidRoom.name = room.name;
    invalidRoom.valid?
    expect(invalidRoom.errors[:name]).to include("is already taken")
  end

end
