require 'rails_helper'

RSpec.describe "Posts", :type => :request do

  before do
    sign_in_as_admin
  end

  describe "GET /posts" do
    it "displays de list of posts" do
      get posts_path
      expect(response).to have_http_status(200)
    end
  end
end
