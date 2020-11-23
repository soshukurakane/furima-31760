class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone_num, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}#郵便番号の正規表現（ハイフンあり）
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_num, format: {with: /\A0[5789]0[-(]?\d{4}[-)]?\d{4}\z/}#電話番号の正規表現(ハイフン無し)
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_num: phone_num, order_id: order.id)
  end
end