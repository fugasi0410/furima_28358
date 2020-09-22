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
    @sell_goods = Sell_good.new(sell_goods_params)
    if @sell_goods.save
      redirect_to sell_goods_path(@sell_goods)
    else
      @sell_goods = Sell_good.new
      render :index
    end
  end
  def show
    @sell_goods = SellGood.all
  end

  private
  def sell_good_params
    params.require(:sell_goods).permit(:name, :cost, :size)
  end

end
