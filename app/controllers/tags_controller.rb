class TagsController < ApplicationController

  before_action :authenticate_admin!, only: [:index, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create]

  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.create(
      user_id: current_user.id,
      dupe_id: params[:dupe_id],
      text: params[:text]
      )
    flash[:success] = "Tag Added"
    redirect_to request.referer
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(
      user_id: current_user.id,
      dupe_id: params[:dupe_id],
      text: params[:text]
      )
    redirect_to "/tags/#{@tag.id}"
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    flash[:success] = "Tag Deleted"
    redirect_to "/tags"
  end
  
end
