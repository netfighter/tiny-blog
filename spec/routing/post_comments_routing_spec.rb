require "rails_helper"

RSpec.describe CommentsController, :type => :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/posts/1/comments").to route_to("action" => "create", "controller" => "comments", "post_id" => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/posts/1/comments/1").to route_to("action" => "destroy", "controller" => "comments", "post_id" => "1", "id" => "1")
    end

  end
end
