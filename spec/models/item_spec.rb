require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'すべてのカラムが存在すれば保存できる' do
      expect(@item).to be_valid
    end

    it 'titleが空では保存できない' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it 'explanationが空では保存できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'category_idが空では保存できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'statusが空では保存できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it 'burdenが空では保存できない' do
      @item.burden_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank")
    end
    it 'areaが空では保存できない' do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end
    it 'dayが空では保存ができない' do
      @item.day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end
    it 'selling_priceが空では保存されない' do
      @item.selling_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price can't be blank")
    end
    it 'imageが空では保存されない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '指定の価格範囲を超えると保存できない' do
      @item.selling_price = 280
      @item.valid?
      expect(@item.errors.full_messages).to include('Selling price must be greater than 299')
    end
    it '価格は半角数字でないと保存されない' do
      @item.selling_price = '４００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Selling price is not a number')
    end
    it '価格範囲が上限以上であると保存できない' do
      @item.selling_price = 99_999_999
      @item.valid?
      expect(@item.errors.full_messages).to include('Selling price must be less than or equal to 9999999')
    end
    it 'category_idが1の時保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it 'status_idが1の時保存できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end
    it 'burden_idが1の時保存できない' do
      @item.burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Burden must be other than 1')
    end
    it 'area_idが1の時保存できない' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Area must be other than 1')
    end
    it 'day_idが１のとき保存できない' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Day must be other than 1')
    end
  end
end
