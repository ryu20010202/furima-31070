require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  before do
    @address_order = FactoryBot.build(:address_order)
  end
  describe "購入情報の保存" do
    context "購入ができる場合" do
      it "購入フォームの全てにデータが入力されていた場合" do
        expect(@address_order).to be_valid
      end
      it "building以外の全てが入力されていた場合" do
        @address_order.building = ""
        expect(@address_order).to be_valid
      end
    end

    context "購入ができない場合" do
      it "postal_cordがからの場合" do
        @address_order.postal_cord = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal cord can't be blank")
      end
      it "postal_cordにハイフンがない場合" do
        @address_order.postal_cord = "1940003"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal cord is invalid")
      end
      it "postal_cordのハイフン前が３桁以外ではいけない" do
        @address_order.postal_cord = "19-0003"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal cord is invalid")
      end
      it "postal_cordのハイフン後が４桁以外ではいけない" do
        @address_order.postal_cord = "194-000"
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postal cord is invalid")
      end
      it "prefecturesが空では登録できない" do
        @address_order.prefectures = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Prefectures can't be blank")
      end
      it "prefecturesが１では登録できない" do
        @address_order.prefectures = 1
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it "municipalityが空では登録できない" do
        @address_order.municipality = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it "house_numberが空では登録できない" do
        @address_order.house_number = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空では登録できない" do
        @address_order.phone_number = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが半角の数字以外が存在した場合登録できない" do
        @address_order.phone_number = 123-456-890
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが10桁未満では登録できない" do
        @address_order.phone_number = 123456789
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが11桁よりも大きくては登録できない" do
        @address_order.phone_number = 123456789012
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できない" do
        @address_order.token = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Token can't be blank")
      end
      it "item_idが空では登録できない" do
        @address_order.item_id = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Item can't be blank")
      end
      it "user_idが空では登録できない" do
        @address_order.user_id = ""
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
