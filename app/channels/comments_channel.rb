class CommentsChannel < ApplicationCable::Channel
  def follow(params)
    stop_all_streams
    post_channel = "comments:post:#{params['post_id'].to_i}"

    stream_from post_channel, -> (encoded_message) do
      ActiveRecord::Base.connection_pool.with_connection do
        message = ActiveSupport::JSON.decode(encoded_message)

        if message["action"] == "create"
          transmit message.merge({ "comment" => render_comment(Comment.new(message["comment"]), current_user) }), via: post_channel
        else
          transmit message, via: post_channel
        end
      end
    end
  end

  def unfollow
    stop_all_streams
  end

  private

  def render_comment(comment, user)
    ApplicationController.render_with_signed_in_user(user, partial: 'comments/comment', locals: { comment: comment })
  end
end
