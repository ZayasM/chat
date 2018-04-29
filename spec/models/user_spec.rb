require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }
  let(:invalidUser) { build(:user) }

  it "has a valid factory" do
    expect(user).to be_valid
  end

  it "has a nick present" do
    invalidUser.nick = nil;
    expect(invalidUser).to be_invalid
  end

end
