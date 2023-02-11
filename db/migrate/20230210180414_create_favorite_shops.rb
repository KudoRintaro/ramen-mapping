class CreateFavoriteShops < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_shops do |t|
      t.references :user, foreign_key: true, null: false
      t.references :shop, foreign_key: true, null: false

      t.timestamps
    end
  end
end
