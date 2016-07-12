class ProductsController < ApplicationController

  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def colorthief
  end

  def index
    @products = Product.all
    @recent_products = Product.all.sort_by { |product| [product.created_at, product.updated_at].max }.reverse!.take(5)

    search = params[:search]

    if search
      @searched = @products.where("name ILIKE ? OR brand ILIKE ? OR product_type ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    end
  end

  def search
    keyword = params[:keyword]
    if keyword.blank? == false
      @search = Unirest.get("http://api.shopstyle.com/api/v2/products?pid=uid6409-34524403-45&fts=#{keyword}&offset=0&limit=20").products
    else
      redirect_to '/'
    end
    
  end

  def show
    @product = Product.find(params[:id])
    @options = Product.all.map { |product| [product.name, product.id] }
    @top_dupes = @product.dupes.sort_by { |product| [product.votes.count] }.reverse!.take(5)

    @color = Color.find(@product.color_id)
    @matches = Color.where.not('red = ? AND green = ? AND blue = ?', @color.red, @color.green, @color.blue).
    where('red BETWEEN ? AND ?', @color.red - 45, @color.red + 45).
    where('green BETWEEN ? AND ?', @color.green - 45, @color.green + 45).
    where('blue BETWEEN ? AND ?', @color.blue - 45, @color.blue + 45).take(3)
  end

  def new
    @product = Product.new
    @color = Color.new
  end

  def create
    @color = Color.find_or_create_by(red: params[:red], green: params[:green], blue: params[:blue])
    @product = Product.create(
      name: params[:name],
      brand: params[:brand],
      product_type: params[:product_type],
      image: params[:image],
      color_id: @color.id
      )
    flash[:success] = "Product Added"
    redirect_to "/products/#{@product.id}"
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
