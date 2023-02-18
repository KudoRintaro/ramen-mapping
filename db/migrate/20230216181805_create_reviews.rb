class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true, null: false
      t.references :shop, foreign_key: true, null: false
      t.float :atmosphere_rate
      t.float :servise_rate
      t.float :taste_rate
      t.float :congestion_rate

      t.timestamps
    end
    add_index :reviews, [:user_id, :shop_id], unique: true
  end
end
