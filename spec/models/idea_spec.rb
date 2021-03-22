require 'rails_helper'
describe Idea do
  before do
    @category = FactoryBot.build(:idea)
  end

  describe 'ideaの保存' do
    # 正常系↓
    context "ideaが保存できる場合" do
      it "bodyとcategory_idがあればideaは保存される（1）" do
        expect(@idea).to be_valid
      end
      it "bodyとcategory_idがあればideaは保存される（2）" do
        idea = Idea.build(:idea)
        idea.valid?
      end
      it "bodyが300文字ならばideaは保存される" do
        idea = Idea.build(:idea)
        @idea.name = 'ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ'
        idea.valid?
      end
    end
    # 異常系↓
    context "ideaが保存できない場合" do
      it "bodyがないとideaは保存できない" do
        idea = FactoryBot.build(:category)
        @idea.body = nil
        @idea.valid?
        expect(@idea.errors.full_messages).to include("bodyを入力してください。")
      end
      it "category_idがないとideaは保存できない" do
        idea = FactoryBot.build(:category)
        @idea.category_id = nil
        @idea.valid?
        expect(@idea.errors.full_messages).to include("category_idを選択してください。")
      end
      it "nameが301文字だとideaは保存できない" do
        idea = FactoryBot.build(:idea)
        @idea.body = 'あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ'
        @idea.valid?
        expect(@idea.errors.full_messages).to include("bodyは300文字以内です。")
      end
    end
  end
end