class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: :destroy

  def create
    @comment = @post.comments.new(comment_params)
    @notification = Notification.create! user: @post.user,
                                         content: "#{current_user.nickname}님이 댓글을 달았습니다.",
                                         link: bulletin_post_path(@post.bulletin, @post)

    @comment.user_name = current_user.nickname
    @comment.save
  end

  def destroy
    @comment.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params[:comment][:user_id] = current_user.id
    params.require(:comment).permit(:body, :user_id)
  end
end