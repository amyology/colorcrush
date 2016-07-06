class WishlistsController < ApplicationController

  before_action :authenticate_user!

  def index
    @wishlist = current_user.products.reverse
  end

  def create
    @wishlist = Wishlist.create(
      user_id: current_user.id, 
      product_id: params[:product_id],
      )
    flash[:success] = "Added to Wishlist"
    redirect_to "/wishlist"
  end
  
end
