class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.references :user, foreign_key: true, null: false
      t.references :genre, foreign_key: true, null: false
      t.references :comment, foreign_key: true, null: true
      t.string :name, null: false
      t.string :location, null: false
      t.time :business_hours, null: false
      t.string :holiday, null: false
      t.float :atmosphere_rate
      t.float :servise_rate
      t.float :taste_rate
      t.float :congestion_rate
      t.integer :status, null: false
      t.integer :favorite_users_count

      t.timestamps
    end
  end
end
