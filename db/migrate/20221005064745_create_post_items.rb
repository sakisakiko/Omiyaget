class CreatePostItems < ActiveRecord::Migration[6.1]
  def change
    create_table :post_items do |t|
      t.integer :customer_id, null: false, default: 0
      t.integer :category_id, null: false, default: 0
      t.integer :buy_prefecture_id, null: false
      t.string :name, null: false, default: ""
      t.text :review
      t.float :evaluation, null: false, default: 0
      t.string :price, null: false, default: ""
      t.string :shop, default: ""
      t.boolean :release, null: false, default: true
      t.timestamps
    end
  end
end
