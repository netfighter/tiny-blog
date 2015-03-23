require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it 'stores in the database' do
    user = FactoryGirl.create(:user)

    expect(User.last).to eq user
  end

  it 'is invalid without an email address' do
    expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
  end

  it 'is invalid without a password' do
    expect(FactoryGirl.build(:user, password: nil)).not_to be_valid
  end

  it 'assigns roles' do
    roles = [
        FactoryGirl.create(:role, name: 'user'),
        FactoryGirl.create(:role, name: 'admin')
    ]
    user = FactoryGirl.create(:user)
    user.add_role(:user)
    user.add_role(:admin)

    expect(user.roles).to eq(roles)
  end
end
