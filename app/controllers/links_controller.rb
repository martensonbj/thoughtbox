class LinksController < ApplicationController
  before_action :require_user, only: [:index]

  def index
    @link = Link.new
    @links = Link.where(user_id: current_user.id)
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to links_path
      flash[:success] = "Link Saved!"
    else
      flash.now[:error] = "Please fill in all fields."
      redirect_to links_path
    end
  end

  private

  def require_user
    redirect_to login_path unless current_user
    flash[:error] = "Please log in or create an account."
  end

  def link_params
    params.require(:link).permit(:url, :title, :user_id)
  end

end
