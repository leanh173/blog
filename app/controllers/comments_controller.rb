class CommentsController < ApplicationController
  before_action :signed_in_user, only: [:create]
  before_action :following_user, only: [:create]
  def create 
	if @comment.save
      flash[:success] = "Comment posted!"
	  redirect_to @comment.entry
	else
	  flash[:error] = "Comment can not be posted! Make sure your comment is not blank"
	  redirect_to @comment.entry
	end
  end

  def destroy
  end

  def following_user
  	@comment = current_user.comments.build(comment_params)
    unless current_user.following? @comment.entry.user
      flash[:error] = "Comment can not be posted! please follow Author to comment this post" 
	  redirect_to @comment.entry
    end
  end

  private
  def comment_params
      params.require(:comment).permit(:comment_content,:entry_id)
    end
end