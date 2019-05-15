require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
  let(:blog_post) { FactoryBot.create(:post) }
  let(:valid_attributes) {
    { post_id: blog_post.id, comment: { content: 'A comment...'} }
  }
  let(:invalid_attributes) {
    { post_id: blog_post.id, comment: {content: ''} }
  }
  let(:user) { FactoryBot.create(:user) }
  let(:ability) { Ability.new(user) }

  before do
    sign_in user
    allow(controller).to receive(:current_ability).and_return(ability)
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: valid_attributes
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, params: valid_attributes
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it "redirects to the created post" do
        post :create, params: valid_attributes
        expect(response).to redirect_to(blog_post)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved post as @comment" do
        post :create, params: invalid_attributes
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "re-renders the 'posts/show' template" do
        post :create, params: invalid_attributes
        expect(response).to render_template("posts/show")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! post: blog_post, content: 'A comment...', user: user
      expect {
        delete :destroy, params: {post_id: blog_post.to_param, id: comment.to_param}
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the post page" do
      comment = Comment.create!  post: blog_post, content: 'A comment...', user: user
      delete :destroy, params: {post_id: blog_post.to_param, id: comment.to_param}
      expect(response).to redirect_to(post_path(blog_post))
    end
  end

end
