require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:comment)).to be_valid
  end

  it 'stores in the database' do
    comment = FactoryBot.create(:comment)

    expect(Comment.last).to eq comment
  end

  it 'is invalid without a post' do
    expect(FactoryBot.build(:comment, post: nil)).not_to be_valid
  end

  it 'is invalid without a content' do
    expect(FactoryBot.build(:comment, content: nil)).not_to be_valid
  end

  it 'is invalid without a user' do
    expect(FactoryBot.build(:comment, user_id: nil)).not_to be_valid
  end
end
