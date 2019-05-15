require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  let(:valid_attributes) {
    {title: 'A blog post', content: 'Some text for my first blog post...'}
  }
  let(:build_attributes) {
    valid_attributes.merge(user: admin)
  }
  let(:invalid_attributes) {
    {title: '', content: ''}
  }
  let(:admin) { FactoryBot.create(:admin) }
  let(:ability) { Ability.new(admin) }

  before do
    sign_in admin
    allow(controller).to receive(:current_ability).and_return(ability)
  end

  describe "GET #index" do
    it "assigns all posts as @posts" do
      post = Post.create! build_attributes
      get :index, params: {}
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET #show" do
    it "assigns the requested post as @post" do
      post = Post.create! build_attributes
      get :show, params: {:id => post.to_param}
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET #new" do
    it "assigns a new post as @post" do
      get :new, params: {}
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET #edit" do
    it "assigns the requested post as @post" do
      post = Post.create! build_attributes
      get :edit, params: {:id => post.to_param}
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: {:post => valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, params: {:post => valid_attributes}
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the created post" do
        post :create, params: {:post => valid_attributes}
        expect(response).to redirect_to(Post.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, params: {:post => invalid_attributes}
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        post :create, params: {:post => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {title: 'Updated blog post', content: 'Updated text for my first blog post...'}
      }

      it "updates the requested post" do
        post = Post.create! build_attributes
        put :update, params: {:id => post.to_param, :post => new_attributes}
        post.reload
      end

      it "assigns the requested post as @post" do
        post = Post.create! build_attributes
        put :update, params: {:id => post.to_param, :post => valid_attributes}
        expect(assigns(:post)).to eq(post)
      end

      it "redirects to the post" do
        post = Post.create! build_attributes
        put :update, params: {:id => post.to_param, :post => valid_attributes}
        expect(response).to redirect_to(post)
      end
    end

    context "with invalid params" do
      it "assigns the post as @post" do
        post = Post.create! build_attributes
        put :update, params: {:id => post.to_param, :post => invalid_attributes}
        expect(assigns(:post)).to eq(post)
      end

      it "re-renders the 'edit' template" do
        post = Post.create! build_attributes
        put :update, params: {:id => post.to_param, :post => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post = Post.create! build_attributes
      expect {
        delete :destroy, params: {:id => post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create! build_attributes
      delete :destroy, params: {id: post.to_param}
      expect(response).to redirect_to(posts_url)
    end
  end

end
