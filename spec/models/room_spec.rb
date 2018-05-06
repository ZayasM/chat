require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:room) { create(:room)}
  let(:invalidRoom) {build(:room)}

  it "is mongoid document" do
    is_expected.to be_mongoid_document
  end

  it "has a valid factory" do
    expect(room).to be_valid
  end

  it "has a Timestamps" do
    is_expected.to have_timestamps 
  end

  describe 'validate name' do

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

    it "name is type String" do
      is_expected.to have_field(:name).of_type(String)
    end

  end

  it "has a relation 1-N with messages" do
    is_expected.to have_many :messages
  end

end
