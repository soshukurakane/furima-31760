class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to action: :index #redirect_to のアクションビューの表示方法の記述はこれ。
    end
  end

  def update
    @item = Item.find(params[:id]) #editと同じ変数でなければ、エラー表示の時にエラー分がでなくなる
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :status_id, :burden_id, :area_id, :day_id, :selling_price).merge(user_id: current_user.id)
  end
end
