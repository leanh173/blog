class EntriesController < ApplicationController
  before_action :signed_in_user, only: [:create]

  def index
  	@entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:success] = "Entry created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def create
  	 @entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def show
  	@entry = Entry.find(params[:id])
  end

  private

    def entry_params
      params.require(:entry).permit(:content,:title)
    end
end