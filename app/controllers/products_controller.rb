class ProductsController < ApplicationController

  before_action :authenticate_admin!, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
    @recent_products = Product.all.sort_by { |product| [product.created_at, product.updated_at].max }.reverse!.take(6)

    @search_term = params[:search]

    if @search_term.blank? == false
      @searched = @products.where("name ILIKE ? OR brand ILIKE ? OR product_type ILIKE ?", "%#{@search_term}%", "%#{@search_term}%", "%#{@search_term}%")
    end
  end

  def search
    keyword = params[:keyword]
    if keyword.blank? == false
      request = Unirest.get("http://api.shopstyle.com/api/v2/products?pid=uid6409-34524403-45&fts=#{keyword}&offset=0&limit=20").body
      @result = request['products']
    else
      redirect_to '/products/new'
    end
  end

  def show
    @product = Product.find(params[:id])
    @options = Product.all.map { |product| [product.name, product.id] }
    @top_dupes = @product.dupes.sort_by { |product| [product.votes.count] }.reverse!.take(5)

    @color = Color.find(@product.color_id)
    @matches = Color.where.not('red = ? AND green = ? AND blue = ?', @color.red, @color.green, @color.blue).
    where('red BETWEEN ? AND ?', @color.red - 30, @color.red + 30).
    where('green BETWEEN ? AND ?', @color.green - 30, @color.green + 30).
    where('blue BETWEEN ? AND ?', @color.blue - 30, @color.blue + 30).take(4)
  end

  def view_product
    @product = Unirest.get("http://api.shopstyle.com/api/v2/products/#{params[:id]}?pid=uid6409-34524403-45").body
  end

  def browse
    @products = Product.all
  end

  def new
    @product = Product.new
    @color = Color.new
  end

  def create
    @color = Color.find_or_create_by(red: params[:red], green: params[:green], blue: params[:blue])
    @product = Product.new(
      name: params[:name],
      brand: params[:brand],
      product_type: params[:product_type],
      image: params[:image],
      color_id: @color.id
      )
    if @product.save
      flash[:success] = "Product Successfully Added."
      redirect_to "/products/#{@product.id}"
    else
      redirect_to request.referer
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(
      name: params[:name],
      brand: params[:brand],
      product_type: params[:product_type],
      color_id: params[:color_id],
      image: params[:image]
      )
    flash[:success] = "Product Updated"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash[:success] = "Product Deleted"
    redirect_to "/"
  end

end
