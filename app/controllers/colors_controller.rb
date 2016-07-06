class ColorsController < ApplicationController

  def index
    @colors = Color.all
  end

  def create
    @color = Color.create(
      red: params[:red],
      green: params[:green],
      blue: params[:blue]
      )
    flash[:success] = "Color Added"
    redirect_to request.referer
  end

  def edit
    @color = Color.find(params[:id])
  end

  def update
    @color = Color.find(params[:id])
    @color.update(
      red: params[:red],
      green: params[:green],
      blue: params[:blue]
      )
    flash[:success] = "Color Updated"
    redirect_to request.referer
  end

  def destroy
    @color = Color.find(params[:id])
    @color.destroy

    flash[:success] = "Color Deleted"
    redirect_to "/colors"
  end
  
end
