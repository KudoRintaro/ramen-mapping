# frozen_string_literal: true

require "rails_helper"

describe "店舗登録のテスト" do
  let(:user) {create(:user)}
  let(:genre) {create(:genre)}
  let!(:shop) {create(:shop, user_id: user.id, genre_id: genre.id)}

  describe "新規登録画面のテスト" do
    before do
      visit new_shop_path
    end
    context "バリデーションの確認" do
      it "入力不備があった場合、バリデーションエラーが表示される" do
        fill_in "shop[name]", with: Faker::Lorem.characters(nil)
        click_button "登録"
        expect(page).to be_invalid "shop[:name]"
      end
    end
  end
end