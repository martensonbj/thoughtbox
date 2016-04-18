class Api::V1::LinksController < ApplicationController
  respond_to :json

  def index
    respond_with Link.all
  end

  def create
    respond_with :api, :v1, Link.create(link_params)
  end

  def destroy
    respond_with Link.destroy(params[:id])
  end

  def update
    link = Link.find(params["id"])
    link.update_attributes(link_params)
    respond_with link, json: link
  end

 private

  def link_params
    params.require(:link).permit(:url, :title, :read, :user_id)
  end
end
