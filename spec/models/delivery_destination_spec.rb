# == Schema Information
#
# Table name: delivery_destinations
#
#  id            :bigint           not null, primary key
#  building_name :string(255)
#  city          :string(255)      default(""), not null
#  house_number  :string(255)      default(""), not null
#  phone_number  :string(255)      default(""), not null
#  postal_code   :string(255)      default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  prefecture_id :integer          not null
#  record_id     :bigint           not null
#
# Foreign Keys
#
#  fk_rails_...  (record_id => records.id)
#
require 'rails_helper'
RSpec.describe Order, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:order)
    end

        it '必須項目に全て記載が必要' do
          expect(@order).to be_valid
        end

        it '郵便番号が空だと購入できない' do
          @order.postal_code = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code can't be blank")

        end

        it "郵便番号にはハイフンが必要であること" do
          @order.postal_code = "1234567"
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code  input correctly")
        end

        it "電話番号にはハイフンは不要で、11桁以内であること" do
          @order.phone_number = "090-2129784"
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number input only number")
        end

        it "電話番号が空だと購入できない" do
          @order.phone_number = ""
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number can't be blank")
        end

        it "都道府県--を選ぶと購入できない" do
          @order.prefecture_id = 0
          @order.valid?
          expect(@order.errors.full_messages).to include("Prefecture can't be blank")
        end

    
        it "市区町村が空だと購入できない" do
          @order.city = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("City can't be blank")
        end

        it "番地が空だと購入できない" do
          @order.house_number = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("House number can't be blank")
        end

        it "建物名は空でも購入できること" do
          @order.building_name = nil
          expect(@order).to be_valid
        end


        it "クレジット情報が空だと購入できない" do
          @order.token = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Token can't be blank")
        end
      end
    end



