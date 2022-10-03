class CommentsController < ApplicationController
  after_action :create_activities
  
  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.post_id = post.id
    comment_item = comment.post
    if comment.save
      #通知の作成
      comment_item.create_notification_comment!(current_user, comment.id)
      render :index
    end
  end

  def destroy
   Comment.find(params[:id]).destroy
   redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
  
  def create_activities
    Activity.create!(subject: self, user: post.user, action_type: :commented_to_own_post)
  end
end
