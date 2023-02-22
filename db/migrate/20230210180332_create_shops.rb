class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      #t.bigint :user, foreign_key: true, null: false
      t.references :user, type: :bigint, foreign_key: true, null: false
      t.references :genre, foreign_key: true, null: false
      t.string :name, null: false
      t.string :location, null: false
      t.time :business_start_hours, null: false
      t.time :business_finish_hours, null: false
      t.string :holiday, null: false

      t.timestamps
    end
  end
end
