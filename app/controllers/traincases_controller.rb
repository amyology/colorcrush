class TraincasesController < ApplicationController

  before_action :authenticate_user!

  def index
    @traincase = current_user.owned_products.reverse
  end

  def create
    @traincase = Traincase.create(
      user_id: current_user.id, 
      product_id: params[:product_id],
      )
    flash[:success] = "Added to Traincase"
    redirect_to "/traincase"
  end
  
end
