class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders
  
  kanji = /\A[ぁ-んァ-ン一-龥]/
  kana = /\A[ァ-ヶー－]+\z/
  validates :email, uniqueness: true #一意性制約
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: kanji }
  validates :first_name, presence: true, format: { with: kanji }
  validates :last_name_kana, presence: true, format: { with: kana }
  validates :first_name_kana, presence: true, format: { with: kana }
  validates :birthday, presence: true
end
