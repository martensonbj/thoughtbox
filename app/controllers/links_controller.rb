class LinksController < ApplicationController
  before_action :require_user, only: [:index]

  def index
    @links = Link.all
  end

  private

  def require_user
    redirect_to login_path unless current_user
    flash[:error] = "Please log in or create an account."
  end
end
