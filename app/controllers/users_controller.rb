class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @traincase = current_user.owned_products.sort_by { |product| [product.updated_at] }.take(6)
    @wishlist = current_user.products.sort_by { |product| [product.updated_at] }.take(6)
  end
  
end
