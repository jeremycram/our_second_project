class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])

  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to shops_path(@shop)
    else
      render :new
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    item = @shop.item
    if @shop.destroy
      flash[:success] = "Deleted #{item}"
    else
      flash[:error] = "Could not destroy #{item} #{@shop.errors.full_messages}"
    end
    redirect_to shops_path
  end


  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      flash[:success] = "Shop #{@shop.item} Updated"
    else
      flash[:error] = "Shop #{@shop.item} not updated #{@shop.errors.full_messages}"
    end
    redirect_to shop_path(@shop)
  end


  private
  def shop_params
    params.require(:shop).permit(:item, :brand, :price)
  end
end
