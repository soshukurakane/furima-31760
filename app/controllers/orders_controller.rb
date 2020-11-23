class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    #item_idでなければ、どのidを引っ張っていけばいいかわからなくなるから、別のコントローラーからidを探すときはしっかり指定してあげなければならない
  end

  def create
    @item = Item.find(params[:item_id])
    #createにも同じ記述を書く必要があるなぜならrender :indexが実行された場合に@itemの情報を持ってindexに飛ばなければいけないから
    #この理論はlink_toでの記述でprefixのパス指定のときに(@tweet.id)などのidを持って次に遷移しなければならないのと同じ
    @order_address = OrderAddress.new(orderess_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def orderess_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_num).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
                                                                                                                  #mergeでどのユーザーが買うのか、と どの商品を買うのかを取得するために上記のような記述になる
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: orderess_params[:token],
      currency: 'jpy'
    )
  end
end


# 詳細ページ：購入画面に進む:2
# ｜
# params[:item_id] 2
# |
# def index
#   @item =Item.find(params[:item_id=2])
# end
# |
# @item
# |
# index.html.erb
#   @item.image

# Button
# |
# params[
#   :item_id 2
#   address
#   token
# ]
# |
# def create




