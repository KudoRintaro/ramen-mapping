class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.float :atmosphere_rate
      t.float :servise_rate
      t.float :taste_rate
      t.float :congestion_rate

      t.timestamps
    end
  end
end
