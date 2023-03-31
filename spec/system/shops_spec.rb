# frozen_string_literal: true

require "rails_helper"

describe "店舗登録のテスト" do
  let!(:user) {FactoryBot.create(:user)}
  let!(:genre) {create(:genre)}
  let!(:shop) {create(:shop, user_id: user.id, genre_id: genre.id)}

  describe "新規登録画面のテスト" do
    before do
      sign_in user
      visit new_shop_path
    end
    context "バリデーションの確認" do
      it "店舗名が空欄の場合、バリデーションエラーが表示される" do
        fill_in "shop[name]", with: ""
        click_button "登録"
        expect(page).to have_content "店舗名を入力してください"
      end
      it "所在地が空欄の場合、バリデーションエラーが表示される" do
        fill_in "shop[location]", with: ""
        click_button "登録"
        expect(page).to have_content "所在地を入力してください"
      end
      it "ジャンル未選択の場合、バリデーションエラーが表示される" do
        fill_in "shop[genre_id]", with: ""
        click_button "登録"
        expect(page).to have_content "ジャンルを入力してください"
      end
      it "有効な投稿内容であれば、問題なく登録されるか" do
        click_button "登録"
        expect(Shop.last.name).to eq("ラーメン")
      end
    end
  end
end