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
      @order_address.save
      redirect_to root_path
    else

      render :index
    end
  end

  private

  def orderess_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_num)
  end
end
