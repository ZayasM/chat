require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }
  let(:invalidUser) { build(:user) }

  it "is mongoid document" do
    is_expected.to be_mongoid_document
  end

  it "has a valid factory" do
    expect(user).to be_valid
  end

  it "has a Timestamps" do
    is_expected.to have_timestamps
  end

  describe 'validate nick' do

    it "nick cant be nil" do
      invalidUser.nick = nil;
      invalidUser.valid?
      expect(invalidUser.errors[:nick]).to include("can't be blank")
    end

    it "nick is type String" do
      is_expected.to have_field(:nick).of_type(String)
    end

  end

  it "has a relation 1-N with messages" do
    is_expected.to have_many :messages
  end

end
