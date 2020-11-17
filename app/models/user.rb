class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email,    uniqueness: true
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } # 半角英数字混合バリデーション

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do # 全角漢字ひらカナ
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do # 全角カナ
      validates :first_name_kana
      validates :last_name_kana
    end
  end
end
