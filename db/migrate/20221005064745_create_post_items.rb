class CreatePostItems < ActiveRecord::Migration[6.1]
  def change
    create_table :post_items do |t|
      t.integer :customer_id, null: false, default: 0
      t.integer :category_id, null: false, default: 0
      t.integer :buy_prefecture_id, null: false
      t.string :name, null: false, default: ""
      t.string :review, null: false, default: ""
      t.float :evaluation, null: false, default: 0
      t.string :price, null: false, default: ""
      t.string :shop, default: ""
      t.boolean :release, null: false, default: true
      t.float :latitude, default: 35.68124
      t.float :longitude, default: 139.7671
      t.timestamps
    end
  end
end
