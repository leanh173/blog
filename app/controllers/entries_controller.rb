class EntriesController < ApplicationController
  before_action :signed_in_user, only: [:create,:new]

  def index
  end

  def new
  	@entry = Entry.new
  end

  def create
  	 @entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:success] = "Entry created!"
      redirect_to root_url
    else
      flash[:error] = "Title/Entry error, please make sure they can not be blank !"
      
      redirect_to new_entry_path
    end
  end

  def show
  	@comment= Comment.new
  	@entry = Entry.find(params[:id])
  	@user= @entry.user
  end

  private

    def entry_params
      params.require(:entry).permit(:content,:title)
    end
end