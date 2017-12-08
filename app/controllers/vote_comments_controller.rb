class VoteCommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: :destroy

  def create
    @vote_comment = @link.vote_comments.new(vote_comment_params)
    @vote_comment.user_names = current_user.nickname
    @vote_comment.save
  end

  def destroy
    @vote_comment.destroy
  end

  private

  def set_post
    @link = Link.find(params[:link_id])
  end

  def set_comment
    @vote_comment = @link.vote_comments.find(params[:id])
  end

  def vote_comment_params
    params[:vote_comment][:user_id] = current_user.id
    params.require(:vote_comment).permit(:body, :user_id)
  end

end