require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:comment)).to be_valid
  end

  it 'stores in the database' do
    comment = FactoryGirl.create(:comment)

    expect(Comment.last).to eq comment
  end

  it 'is invalid without a post' do
    expect(FactoryGirl.build(:comment, post: nil)).not_to be_valid
  end

  it 'is invalid without a content' do
    expect(FactoryGirl.build(:comment, content: nil)).not_to be_valid
  end

  it 'is invalid without a user' do
    expect(FactoryGirl.build(:comment, user_id: nil)).not_to be_valid
  end
end
