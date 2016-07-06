class DupesController < ApplicationController

  before_action :authenticate_admin!, only: [:index, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create]

  def index
    @dupes = Dupe.all
  end

  def create
    @dupe = Dupe.create(
      primary_id: params[:primary_id],
      secondary_id: params[:secondary_id]
      )
    flash[:success] = "Dupe Added"
    redirect_to request.referer
  end 

  def edit
    @dupe = Dupe.find(params[:id])
  end

  def update

  end

  def destroy
    @dupe = Dupe.find(params[:id])
    @dupe.destroy

    flash[:success] = "Dupe Deleted"
    redirect_to "/dupes"
  end

end
