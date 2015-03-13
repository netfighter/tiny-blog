require 'rails_helper'

RSpec.describe Role, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:role)).to be_valid
  end

  it 'stores in the database' do
    role = FactoryGirl.create(:role)

    expect(Role.last).to eq role
  end

  it 'is invalid without a name' do
    expect(FactoryGirl.build(:role, name: nil)).not_to be_valid
  end

  it 'assigns users' do
    users = [FactoryGirl.create(:user, first_name: 'Foo'), FactoryGirl.create(:user)]

    role = FactoryGirl.create(:admin_role, users: users)

    expect(Role.find_by_name('admin').users).to eq(users)
    expect(User.find_by_first_name('Foo').roles).to include(role)
  end
end
