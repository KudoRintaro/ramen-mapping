class CreateShopComments < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_comments do |t|
      t.references :user, foreign_key: true, null: false
      t.references :shop, foreign_key: true, null: false
      t.text :comment
      t.timestamps
    end
  end
end
