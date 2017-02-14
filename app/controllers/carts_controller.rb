class CartsController < ApplicationController
  before_action :set_shop, only: [:create]
  def index
    @carts = Cart.all
    binding.pry
  end

  def show
  end

  def new
  end

  def create
    @cart = @shop.carts.new(item: @shop.item, brand: @shop.brand, price: @shop.price)
    @cart.save
    redirect_to shops_path
    # if @cart.save
    # else
    #   redirect_to shops_path
    # end
  end

  def edit

  end

  def destroy
    @shop.destroy
    flash[:success] = 'item removed'
    redirect_to carts_path
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

end
