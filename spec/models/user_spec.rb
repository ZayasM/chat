require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }
  let(:invalidUser) { build(:user) }

  it "has a valid factory" do
    expect(user).to be_valid
  end

  it "nick cant be nil" do
    invalidUser.nick = nil;
    invalidUser.valid?
    expect(invalidUser.errors[:nick]).to include("can't be blank")
  end

end
