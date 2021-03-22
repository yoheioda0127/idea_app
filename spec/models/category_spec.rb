require 'rails_helper'
describe Category do
  before do
    @category = FactoryBot.build(:category)
  end

  describe 'categoryの保存' do
    # 正常系↓
    context "categoryが保存できる場合" do
      it "nameがあればcategoryは保存される（1）" do
        expect(@category).to be_valid
      end
      #ファクトリーボットの動作確認↓
      it "nameがあればcategoryは保存される（2）" do
        category = Category.build(:category)
        category.valid?
      end
      #ファクトリーボットの動作確認↓
      it "nameが8文字以下ならばcategoryは保存される" do
        category = Category.build(:category)
        @category.name = 'あああああああ'
        category.valid?
      end
    end
    # 異常系↓
    context "categoryが保存できない場合" do
      it "nameがないとcategoryは保存できない" do
        category = FactoryBot.build(:category)
        @category.name = nil
        @category.valid?
        expect(@category.errors.full_messages).to include("nameを入力してください")
      end
      it "nameが9文字だとcategoryは保存できない" do
        category = FactoryBot.build(:category)
        @category.name = 'あああああああああ'
        @category.valid?
        expect(@category.errors.full_messages).to include("nameは8文字以内です。")
      end
    end
  end
end