class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @address_order = AddressOrder.new
  end

  def create
    binding.pry
    @address_order = AddressOrder.new(order_params)
    if @address_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private

  def order_params
    params.require(:address_order).permit(:postal_cord, :prefectures, :municipality, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
