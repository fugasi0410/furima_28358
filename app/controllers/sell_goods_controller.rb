class SellGoodsController < ApplicationController
  def index
    @sell_goods = Sell_good.all
  end
  def new
    @sell_goods = Sell_good.new
  end
  def create
    Sell_good.create(sell_goods_params)
  end

  private
  def tweet_params
    params.require(:sell_goods).permit(:name, :cost, :size)
  end

end
