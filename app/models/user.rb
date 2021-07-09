class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  validates :surname, presence: true
  validates :first_name, presence: true
  validates :kana_surname, presence: true
  validates :kana_first_name, presence: true
  validates :birthday, presence: true

  # 正規表現の記述がわかりません、、、

  has_many :items
  has_many :buys
end