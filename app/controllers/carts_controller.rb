class CartsController < ApplicationController
  before_action :set_shop, only: [:create]
  def index
    @carts = Cart.all

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
    @cart = Cart.find(params[:id])
    item = @cart.item
    if @cart.destroy
      flash[:success] = "Deleted #{item}"
    else
      flash[:error] = "Could not destroy #{item} #{@cart.errors.full_messages}"
    end
    redirect_to carts_path
  end



    

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

end
