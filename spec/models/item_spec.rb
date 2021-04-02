# == Schema Information
#
# Table name: items
#
#  id              :bigint           not null, primary key
#  explanation     :text(65535)      not null
#  name            :string(255)      not null
#  price           :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :integer          not null
#  condition_id    :integer          not null
#  delivery_fee_id :integer          not null
#  prefecture_id   :integer          not null
#  shipping_day_id :integer          not null
#  user_id         :bigint           not null
#
require 'rails_helper'

describe Item, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
    end



    it "必要事項が入力されていれば出品できる" do
      expect(@item).to be_valid
    end
  

    it "商品画像がないと出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Imageを入力してください")
    end


    it "商品名がないと出品できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Nameを入力してください")
    end


    it "商品名が41文字以上だと出品できない" do
      @item.name = "a" * 41
      @item.valid?
      expect(@item.errors.full_messages).to include("Nameは40文字以内で入力してください")
    end


    it "商品説明がないと出品できない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanationを入力してください")
    end


    it "商品説明が1001文字以上だと出品できない" do
      @item.explanation = "a" * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanationは1000文字以内で入力してください")
    end



    it "カテゴリ--を選ぶと出品できない" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Categoryは0以外の値にしてください")
    end

    it "商品状態--を選ぶと出品できない" do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Conditionは0以外の値にしてください")
    end


    it "都道府県--を選ぶと出品できない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectureは0以外の値にしてください")
    end

    it "発送日数--を選ぶと出品できない" do
      @item.shipping_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping dayは0以外の値にしてください")
    end


    it "配送料負担--を選ぶと出品できない" do
      @item.delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery feeは0以外の値にしてください")
    end

    it "金額が入ってないと出品できない" do
      @item.price = "あああ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
    end

    it "商品価格が299円以下だと出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Priceは300以上の値にしてください")
    end

    it "商品価格が10000000円以上だと出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Priceは9999999以下の値にしてください")
    end
  end
end



