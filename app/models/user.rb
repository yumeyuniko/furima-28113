# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  birthday               :date             not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)      not null
#  first_name_kana        :string(255)      not null
#  last_name              :string(255)      not null
#  last_name_kana         :string(255)      not null
#  nickname               :string(255)      not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         omniauth_providers: [:facebook, :google_oauth2]

  has_many :items, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy
  has_many :comments, dependent: :destroy # commentsテーブルとのアソシエーション
  has_many :records, dependent: :destroy

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  # 漢字と全角の平仮名とカタカナのバリデーション
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates :last_name,
            :first_name,
            presence: true,
            format: {
              with: VALID_NAME_REGEX,
              message: 'は全角で入力してください'
            }

  # 全角カタカナ
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :last_name_kana,
            :first_name_kana,
            presence: true,
            format: {
              with: VALID_KANA_NAME_REGEX,
              message: 'は全角カナで入力してください'
            }
  validates :birthday, presence: true

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )

    # userが登録済みであるか判断
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
