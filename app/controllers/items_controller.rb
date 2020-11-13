class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to root_path
    else
      @item = item
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    item = Item.find(params[:id])
    if item.present?
      if item.update(item_params)
        redirect_to item_path(item[:id])
      else
        @item = item
        render :edit
      end
    else
      render root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :condition_id, :burden_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
