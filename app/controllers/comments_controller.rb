class CommentsController < ApplicationController
  load_and_authorize_resource
  before_filter :find_post

  def create
    @comment = @post.comments.build(params[:comment])
    @comment.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, include: :user, status: :created }
      else
        format.html { render template: 'posts/show', locals: { comment: @comment } }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1/comments/1
  # DELETE /posts/1/comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.json { head :no_content }
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
