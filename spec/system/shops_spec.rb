# frozen_string_literal: true

require "rails_helper"

describe "店舗登録のテスト" do
  let!(:user) {FactoryBot.create(:user)}
  let!(:genre) {FactoryBot.create(:genre)}
  let!(:shop) {FactoryBot.create(:shop, user_id: user.id, genre_id: genre.id)}
  let!(:review) {FactoryBot.create(:review, user_id: user.id, shop_id: shop.id)}
  let(:comment) {FactoryBot.create(:comment, user_id: user.id, shop_id: shop.id)}

  describe "新規登録画面のテスト" do
    before do
      sign_in user
      visit new_shop_path
    end
    context "バリデーションの確認" do
      it "店舗名が空欄の場合、バリデーションエラーが表示される" do
        fill_in "店名", with: ""
        fill_in "所在地", with: "東京都新宿区落合2"
        select "09", from: "shop[business_start_hours(4i)]"
        select "30", from: "shop[business_start_hours(5i)]"
        select "17", from: "shop[business_finish_hours(4i)]"
        select "30", from: "shop[business_finish_hours(5i)]"
        find("option[value=1]").select_option
        select "月曜日", from: "休業日"
        attach_file "店舗画像", "#{Rails.root}/app/assets/images/ramen1.jpg"
        click_button "登録"
        expect(page).to have_content "店舗名を入力してください"
      end
      it "所在地が空欄の場合、バリデーションエラーが表示される" do
        fill_in "店名", with: "ラーメン屋"
        fill_in "所在地", with: ""
        select "09", from: "shop[business_start_hours(4i)]"
        select "30", from: "shop[business_start_hours(5i)]"
        select "17", from: "shop[business_finish_hours(4i)]"
        select "30", from: "shop[business_finish_hours(5i)]"
        find("option[value=1]").select_option
        select "月曜日", from: "休業日"
        attach_file "店舗画像", "#{Rails.root}/app/assets/images/ramen1.jpg"
        click_button "登録"
        expect(page).to have_content "所在地を入力してください"
      end
      it "ジャンル未選択の場合、バリデーションエラーが表示される" do
        fill_in "店名", with: "ラーメン屋"
        fill_in "所在地", with: "東京都新宿区落合2"
        select "09", from: "shop[business_start_hours(4i)]"
        select "30", from: "shop[business_start_hours(5i)]"
        select "17", from: "shop[business_finish_hours(4i)]"
        select "30", from: "shop[business_finish_hours(5i)]"
        select "月曜日", from: "休業日"
        attach_file "店舗画像", "#{Rails.root}/app/assets/images/ramen1.jpg"
        click_button "登録"
        expect(page).to have_content "ジャンルを入力してください"
      end
      it "休業日が未選択の場合、バリデーションエラーが表示される" do
        fill_in "店名", with: "ラーメン屋"
        fill_in "所在地", with: "東京都新宿区落合2"
        select "09", from: "shop[business_start_hours(4i)]"
        select "30", from: "shop[business_start_hours(5i)]"
        select "17", from: "shop[business_finish_hours(4i)]"
        select "30", from: "shop[business_finish_hours(5i)]"
        find("option[value=1]").select_option
        attach_file "店舗画像", "#{Rails.root}/app/assets/images/ramen1.jpg"
        click_button "登録"
        expect(page).to have_content "休業日を入力してください"
      end
      it "画像が未選択の場合、バリデーションエラーが表示される" do
        fill_in "店名", with: "ラーメン屋"
        fill_in "所在地", with: "東京都新宿区落合2"
        select "09", from: "shop[business_start_hours(4i)]"
        select "30", from: "shop[business_start_hours(5i)]"
        select "17", from: "shop[business_finish_hours(4i)]"
        select "30", from: "shop[business_finish_hours(5i)]"
        find("option[value=1]").select_option
        select "月曜日", from: "休業日"
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
        find("option[value=1]").select_option
        select "月曜日", from: "休業日"
        attach_file "店舗画像", "#{Rails.root}/app/assets/images/ramen1.jpg"
        click_button "登録"
        expect(Shop.last.name).to eq("ラーメン屋")
      end
      it "店舗登録後に、店舗詳細画面に遷移するか" do
        fill_in "店名", with: "ラーメン屋"
        fill_in "所在地", with: "東京都新宿区落合2"
        select "09", from: "shop[business_start_hours(4i)]"
        select "30", from: "shop[business_start_hours(5i)]"
        select "17", from: "shop[business_finish_hours(4i)]"
        select "30", from: "shop[business_finish_hours(5i)]"
        find("option[value=1]").select_option
        select "月曜日", from: "休業日"
        attach_file "店舗画像", "#{Rails.root}/app/assets/images/ramen1.jpg"
        click_button "登録"
        expect(page).to have_current_path shop_path(Shop.last)
      end
    end
  end
  describe "店舗詳細画面のテスト" do
    before do
      sign_in user
      visit shop_path(shop)
    end
    context "urlの表示確認" do
      it "urlの表記が/shops/:idになっているか" do
        expect(current_path).to eq("/shops/1")
      end
    end
    context "店舗詳細情報の表示確認" do
      it "店名が正確に表示されているか" do
        expect(page).to have_content "ラーメン"
      end
      it "所在地が正確に表示されているか" do
        expect(page).to have_content shop.location
      end
      it "ジャンル名が正確に表示されているか" do
        expect(page).to have_content shop.genre.name
      end
      it "営業時間が正確に表示されているか" do
        expect(page).to have_content shop.business_start_hours.strftime("%H:%M")
        expect(page).to have_content shop.business_finish_hours.strftime("%H:%M")
      end
      it "登録日が正確に表示されているか" do
        expect(page).to have_content shop.created_at.strftime("%Y/%m/%d")
      end
    end
    context "ratyの表示確認" do
      it "ratyが問題なく表示されているか" do
        expect(page).to have_selector "#average-raty-atmosphere-1"
        expect(page).to have_selector "#average-raty-servise-1"
        expect(page).to have_selector "#average-raty-taste-1"
        expect(page).to have_selector "#average-raty-congestion-1"
      end
    end
    context "お気に入り登録ボタンの表示確認" do
      it "お気に入り登録のボタンが表示されているか" do
        expect(page).to have_link "お気に入り登録"
      end
      it "お気に入り登録のボタンを押下した場合、「お気に入り解除」の表記になるか" do
        click_link "お気に入り登録"
        expect(page).to have_link "お気に入り解除"
      end
    end
    context "レビュー投稿機能の確認" do
      it "レビュー投稿フォームが問題なく表示されているか" do
        expect(page).to have_selector "#average-raty-atmosphere-post-1"
        expect(page).to have_selector "#average-raty-servise-post-1"
        expect(page).to have_selector "#average-raty-taste-post-1"
        expect(page).to have_selector "#average-raty-congestion-post-1"
        expect(page).to have_button "評価する"
      end

    end
    context "コメント投稿機能の確認" do
      it "コメント投稿フォームが問題なく表示されているか" do
        expect(page).to have_selector ".comment-form-box"
        expect(page).to have_selector ".comment-form-label"
        expect(page).to have_selector ".comment-form"
        expect(page).to have_button "投稿"
      end
      it "コメントが問題なく投稿されるか" do
        fill_in "comment[comment]", with: "とてもおいしいです。"
        click_button "投稿"
        expect(Shop.comment.last.comment).to eq("とてもおいしいです")
      end
    end
  end
end