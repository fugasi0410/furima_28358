require 'rails_helper'

RSpec.describe Order, type: :model do
  RSpec.describe Pey, type: :model do
      it 'post_codeが空だと保存できないこと' do
        @pey.post_code = nil
        @pey.valid?
        expect(@pey.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @pey.post_code = '1234567'
        @pey.valid?
        expect(@pey.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @pey.prefecture = 0
        @pey.valid?
        expect(@pey.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityは空では保存出来ないこと' do
        @pey.city = nil
        expect(@pey).to be_valid
      end
      it 'street_numberは空では保存出来ないこと' do
        @pey.street_number = nil
        expect(@pey).to be_valid
      end
      it 'building_nameは空では保存出来ないこと' do
        @pey.building_name = nil
        expect(@pey).to be_valid
      end
      it 'phone_numberは空では保存出来ないこと' do
        @pey.phone_number = nil
        expect(@pey).to be_valid
      end
    end
  end
end
