class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  
  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
   #漢字と全角の平仮名とカタカナのバリデーション
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name, :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: "は全角で入力してください" }
 #全角カタカナ
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana, :first_name_kana, presence: true, format: { with: VALID_KANA_NAME_REGEX, message: "は全角カナで入力してください" }
  validates :birthday, presence: true
end
