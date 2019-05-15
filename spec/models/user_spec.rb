require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'stores in the database' do
    user = FactoryBot.create(:user)

    expect(User.last).to eq user
  end

  it 'is invalid without an email address' do
    expect(FactoryBot.build(:user, email: nil)).not_to be_valid
  end

  it 'is invalid without a password' do
    expect(FactoryBot.build(:user, password: nil)).not_to be_valid
  end

  it 'assigns roles' do
    roles = [
        FactoryBot.create(:role, name: 'user'),
        FactoryBot.create(:role, name: 'admin')
    ]
    user = FactoryBot.create(:user)
    user.add_role(:user)
    user.add_role(:admin)

    expect(user.roles).to eq(roles)
  end
end
