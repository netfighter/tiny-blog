require 'rails_helper'

RSpec.describe ::Post, :type => :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:post)).to be_valid
  end

  it 'stores in the database' do
    post = FactoryBot.create(:post)

    expect(Post.last).to eq post
  end

  it 'is invalid without a title' do
    expect(FactoryBot.build(:post, title: nil)).not_to be_valid
  end

  it 'is invalid without a content' do
    expect(FactoryBot.build(:post, content: nil)).not_to be_valid
  end

  it 'is invalid without a user' do
    post = FactoryBot.build(:post)
    post.user = nil

    expect(post).not_to be_valid
  end

end
