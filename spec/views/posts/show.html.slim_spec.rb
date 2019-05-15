require 'rails_helper'

RSpec.describe "posts/show", :type => :view do
  let(:admin) { FactoryBot.create(:admin) }

  before do
    sign_in admin
  end

  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "Title",
      :content => "Content",
      :user => admin
    ))
  end

  it 'renders attributes' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Content/)
  end

  it 'renders the new comment form' do
    render
    expect(rendered).to match(/Leave a comment/)
  end

  it 'renders the comments' do
    FactoryBot.create(:comment, post: @post, content: 'Test comment')
    render
    expect(rendered).to match(/Test comment/)
  end
end
