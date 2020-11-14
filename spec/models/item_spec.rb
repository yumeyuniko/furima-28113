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
  

    it "商品名がないと出品できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end


    it "商品名が41文字以上だと出品できない" do
      @item.name = "a" * 41
      @item.valid?
      expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
    end


    it "商品説明がないと出品できない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end


    it "商品説明が1001文字以上だと出品できない" do
      @item.explanation = "a" * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation is too long (maximum is 1000 characters)")
    end



    it "カテゴリ--を選ぶと出品できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "商品状態--を選ぶと出品できない" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end


    it "都道府県--を選ぶと出品できない" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it "発送日数--を選ぶと出品できない" do
      @item.shipping_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day must be other than 0")
    end

    it "金額が入ってないと出品できない" do
      @item.price = "あああ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "商品価格が299円以下だと出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "商品価格が10000000円以上だと出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end
end



