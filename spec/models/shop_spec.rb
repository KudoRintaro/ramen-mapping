# frozen_string_literal: true

require "rails_helper"

describe "Shopモデルのテスト" do
  let(:user) {create(:user)}
  let(:genre) {create(:genre)}

  it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:shop, user_id: user.id, genre_id: genre.id)).to be_valid
  end
end