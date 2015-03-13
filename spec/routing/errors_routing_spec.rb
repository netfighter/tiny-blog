require 'rails_helper'


RSpec.describe ErrorsController, :type => :routing do

  shared_examples_for "error pages" do |status_code|
    it "should route to show with status code #{status_code}" do
      expect(:get => "/#{status_code}").to route_to(controller: 'errors',
                                                    action: 'show',
                                                    status_code: status_code)
    end
  end

  describe "routing" do
    describe "errors" do
      describe "when I GET /403" do
        it_behaves_like "error pages", "403"
      end

      describe "when I GET /404" do
        it_behaves_like "error pages", "404"
      end

      describe "when I GET /422" do
        it_behaves_like "error pages", "422"
      end

      describe "when I GET /500" do
        it_behaves_like "error pages", "500"
      end
    end
  end

end
