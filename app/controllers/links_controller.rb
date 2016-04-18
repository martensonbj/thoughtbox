class LinksController < ApplicationController
  before_action :require_user, only: [:index]

  def index
    @links = Link.all
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to links_path
      flash[:success] = "Link Saved!"
    else
      redirect_to links_path
      flash[:error] = "Please fill in all fields."
    end
  end

  private

  def require_user
    redirect_to login_path unless current_user
    flash[:error] = "Please log in or create an account."
  end

  def link_params
    params.require(:link).permit(:url, :title)
  end

end
