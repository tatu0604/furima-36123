class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_find, only: [:index, :create]
  before_action :move_to_root

  def index
    @buy_form = BuyForm.new
  end

  def create
    @buy_form = BuyForm.new(set_params)
    if @buy_form.valid?
      pay_item
      @buy_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_params
    params.require(:buy_form).permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: set_params[:token],
      currency: 'jpy'
    )
  end

  def set_find
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    redirect_to root_path if @item.buy.present?
  end
end
