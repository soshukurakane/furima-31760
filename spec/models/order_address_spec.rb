require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@order_address).to be_valid
  end
  it 'post_codeが空だと保存できないこと' do
    @order_address.post_code = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Post code can't be blank")
  end
  it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @order_address.post_code = '1234567'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('Post code is invalid')
  end
  it 'prefectureを選択していないと保存できないこと' do
    @order_address.prefecture_id = 0
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('Prefecture must be other than 0')
  end
  it 'cityが空では保存できない' do
    @order_address.city = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("City can't be blank")
  end
  it 'addressは空では保存できないこと' do
    @order_address.address = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Address can't be blank")
  end
  it 'phone_numが空では保存できない' do
    @order_address.phone_num = ''
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
  end
  it 'phone_numハイフンがあると保存できない' do
    @order_address.phone_num = '090-29'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('Phone num is invalid')
  end
  it 'phone_numが11桁いないでないと保存できない' do
    @order_address.phone_num = '123456789012'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('Phone num is invalid')
  end
  it 'buildingは空でも保存できること' do
    @order_address.building = nil
    expect(@order_address).to be_valid
  end

  it 'tokenが空では保存できない' do
    @order_address.token = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Token can't be blank")
  end
end
