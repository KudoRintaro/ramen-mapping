# frozen_string_literal: true

require "rails_helper"

describe "店舗登録のテスト" do
  let!(:user) {FactoryBot.create(:user)}
  let!(:genre) {FactoryBot.create(:genre)}
  let!(:shop) {create(:shop, user_id: user.id, genre_id: genre.id)}

  describe "新規登録画面のテスト" do
    before do
      sign_in user
      visit new_shop_path
    end
    context "バリデーションの確認" do
      it "店舗名が空欄の場合、バリデーションエラーが表示される" do
        fill_in "店名", with: ""
        click_button "登録"
        expect(page).to have_content "店舗名を入力してください"
      end
      it "所在地が空欄の場合、バリデーションエラーが表示される" do
        fill_in "所在地", with: ""
        click_button "登録"
        expect(page).to have_content "所在地を入力してください"
      end
      it "ジャンル未選択の場合、バリデーションエラーが表示される" do
        select "--選択してください--", from: "ジャンル"
        click_button "登録"
        expect(page).to have_content "ジャンルを入力してください"
      end
      it "休業日が未選択の場合、バリデーションエラーが表示される" do
        select "選択してください", from: "休業日"
        click_button "登録"
        expect(page).to have_content "休業日を入力してください"
      end
      it "画像が未選択の場合、バリデーションエラーが表示される" do
        click_button "登録"
        expect(page).to have_content "店舗画像を入力してください"
      end
    end
    context "新規登録機能の確認" do
      it "有効な投稿内容であれば、問題なく登録されるか" do
        fill_in "店名", with: "ラーメン屋"
        fill_in "所在地", with: "東京都新宿区落合2"
        select "09", from: "shop[business_start_hours(4i)]"
        select "30", from: "shop[business_start_hours(5i)]"
        select "17", from: "shop[business_finish_hours(4i)]"
        select "30", from: "shop[business_finish_hours(5i)]"
        select "月曜日", from: "休業日"
        attach_file "店舗画像", "#{Rails.root}/app/assets/images/ramen1.jpg"
        click_button "登録"
        expect(Shop.last.name).to eq("ラーメン屋")
      end
    end
  end
end