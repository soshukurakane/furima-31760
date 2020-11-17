class Item < ApplicationRecord
  has_one_attached :image
  has_one :order
  belongs_to :user
  # if the error cause here, you should restart. That is 'rails s'
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :day
  
  with_options presence: true do
    validates :image
    validates :title
    validates :explanation
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_id
    validates :selling_price, numericality: { only_integer: true, greater_than: 299, less_than_or_equal_to: 9999999 }
                              #上記はまず、cumericalityが整数であるかどうかや、指定値以上(以下・未満・等しい)かどうかなどを検証できる
                              #only_integer: true を使うと、整数のみの制限を加えることができる。gerater_than: はその数より大きい
                              #less_than_or_equal_to はその数以下　lessがgreaterになるとその数以上になる
  end
end
