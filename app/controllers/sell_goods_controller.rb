class SellGoodsController < ApplicationController

  def index
    @sell_goods = SellGood.all
    #@sell_goods = SellGood.all.order("created_at DESC")
  end
  def new
    @sell_good = SellGood.new
   # @sell_good = SellGood.order("created_at DESC")
  end
  def create
    @sell_good = SellGood.new(sell_good_params)
    if @sell_good.save
      redirect_to sell_goods_path(@sell_goods)
    else
      # @sell_good = SellGood.new
      render 'new'
    end
  end
  
  def show
    @sell_good = SellGood.find(params[:id])
  end
  def edit
    @sell_good = SellGood.find(params[:id])
  end
  def update
    sell_good = SellGood.find(params[:id])
    sell_good.update(sell_good_params)
    redirect_to sell_goods_path(@sell_goods)
  end

  private
  def sell_good_params
    params.require(:sell_good).permit(:name, :cost, :status, :size_id, :category_id, :shipping_cost_id, :shipping_day_id, :shipping_prefecture_id, :price, :image).merge(user_id: current_user.id)
    #params.require(:sell_good).permit(:sell_good, :image).merge(user_id: sell_good.id)
  end

end
