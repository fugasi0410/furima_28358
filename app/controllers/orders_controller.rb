class OrdersController < ApplicationController
  before_action :set_sellgood, only: [:index, :create]

  def index
    @order = Pay.new
  end

  def create
    @order = Pay.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:pay).permit(:post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], sell_good_id: params[:sell_good_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @sell_good.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def set_sellgood
    @sell_good = SellGood.find(params[:sell_good_id])
  end

end
