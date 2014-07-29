class CommentsController < ApplicationController
  before_action :signed_in_user, only: [:create]

  def create 
  	@comment = current_user.comments.build(comment_params)
  	if @comment.save
      flash[:success] = "Comment posted!"
      redirect_to @comment.entry
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private
  def comment_params
      params.require(:comment).permit(:comment_content,:entry_id)
    end
end