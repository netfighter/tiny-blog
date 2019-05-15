require 'rails_helper'

RSpec.describe "posts/index", :type => :view do
  let(:admin) { FactoryBot.create(:admin) }

  before do
    Settings.frontend.use_mvc = false
    sign_in admin
  end

  before(:each) do
    assign(:posts, [
      Post.create!(
        :title => "Title",
        :content => "Content",
        :user => admin
      ),
      Post.create!(
        :title => "Title",
        :content => "Content",
        :user => admin
      )
    ])
  end

  it 'renders a list of posts' do
    render
    assert_select "#posts-list>div>h2", :count => 2
    assert_select "#posts-list>div>div", :text => "Content".to_s, :count => 2
  end

  describe 'only admins can create posts' do
    context 'admin' do
      it 'is allowed to add a new post' do
        render
        expect(rendered).to match(/New Post/)
      end
    end

    context 'user' do
      let(:user) { FactoryBot.create(:user) }

      before do
        sign_in user
      end

      it 'is not allowed to add a new post' do
        render
        expect(rendered).not_to match(/New Post/)
      end
    end
  end
end
