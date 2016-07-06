class VotesController < ApplicationController

  before_action :authenticate_admin!, only: [:index, :destroy]
  
  def index
    @votes = Vote.all
  end

  def create
    @vote = Vote.create(
      user_id: current_user.id,
      dupe_id: params[:dupe_id]
      )
    flash[:success] = "Vote Added"
    redirect_to request.referer
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    flash[:success] = "Vote Deleted"
    redirect_to "/votes"
  end
    
end
