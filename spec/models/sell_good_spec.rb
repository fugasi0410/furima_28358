require 'rails_helper'

describe Sell_good do
  before do
    @sell_good = FactoryBot.build(:sell_good)
  end
  describe '商品出品機能' do
    context 'うまくいくとき' do
      it "ログインしているユーザーだけが、出品ページへ遷移できること" do
        expect(@sell_good).to be_valid
      end
      end
      it "priseの範囲が、¥300~¥9,999,999の間であること" do
        @sell_good.prise = 400
        expect(@sell_good).to be_valid
      end
      it "入力された販売価格によって、非同期的に販売手数料や販売利益が変わること(" do
        expect(@sell_good).to be_valid
      end
    end
    context 'うまくいかないとき' do
      it "imageが空だと投稿できない" do
        @sell_good.image = nil
        @sell_good.valid?
        expect(@sell_good.errors.full_messages).to include("image can't be blank")
      end
      it "nameが空だと投稿できない" do
        @sell_good.name = nil
        @sell_good.valid?
        expect(@sell_good.errors.full_messages).to include("name can't be blank")
      end
      it "statusが空だと投稿できない" do
        @sell_good.status = nil
        @sell_good.valid?
        expect(@sell_good.errors.full_messages).to include("status can't be blank")
      end
      it "categoryが空だと投稿できない" do
        @sell_good.category = nil
        @sell_good.valid?
        expect(@sell_good.errors.full_messages).to include("category can't be blank")
      end
      it "sizeが空だと投稿できない" do
        @sell_good.size = nil
        @sell_good.valid?
        expect(@sell_good.errors.full_messages).to include("size can't be blank")
      end
      it "shipping_costが空だと投稿できない" do
        @sell_good.shipping_cost = nil
        @sell_good.valid?
        expect(@sell_good.errors.full_messages).to include("shipping_cost can't be blank")
      end
      it "shipping_daysが空だと投稿できない" do
        @sell_good.shipping_days = nil
        @sell_good.valid?
        expect(@sell_good.errors.full_messages).to include("shipping_days can't be blank")
      end
      it "shipping_prefectureが空だと投稿できない" do
        @sell_good.shipping_prefecture = nil
        @sell_good.valid?
        expect(@sell_good.errors.full_messages).to include("shipping_prefecture can't be blank")
      end
      it "costが空だと投稿できない" do
        @sell_good.cost = nil
        @sell_good.valid?
        expect(@sell_good.errors.full_messages).to include("cost can't be blank")
    end
  end
end  
