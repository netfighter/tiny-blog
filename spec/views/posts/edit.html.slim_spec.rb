require 'rails_helper'

RSpec.describe "posts/edit", :type => :view do
  let(:admin) { FactoryBot.create(:admin) }

  before do
    sign_in admin
  end

  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "MyString",
      :content => "MyString",
      :user => admin
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "textarea#post_content[name=?]", "post[content]"
    end
  end
end
