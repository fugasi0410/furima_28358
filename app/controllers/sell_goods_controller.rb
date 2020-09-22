class SellGoodsController < ApplicationController
  def index
    @sell_goods = Sell_good.all.order("created_at DESC")
  end
  def new
    @sell_goods = Sell_good.new
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
    #@sell_goods = Sell_good.all
  end

  private
  def sell_good_params
    params.require(:sell_good).permit(:name, :cost, :status, :size_id, :category_id, :shipping_cost_id, :shipping_day_id, :shipping_prefecture_id, :price, :image)
    #params.require(:sell_good).permit(:sell_good, :image).merge(user_id: sell_good.id)
  end

end
