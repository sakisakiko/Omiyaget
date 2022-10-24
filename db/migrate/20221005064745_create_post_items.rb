class CreatePostItems < ActiveRecord::Migration[6.1]
  def change
    create_table :post_items do |t|
      t.integer :customer_id, null: false, default: 0
      t.integer :category_id, null: false, default: 0
      t.string :name, null: false, default: ""
      t.text :review, null: false
      t.float :evaluation, null: false, default: 0
      t.string :price, null: false, default: ""
      t.string :shop, null: false, default: ""
      t.boolean :release, null: false, default: true
      t.integer :buy_prefecture, null: false, default: 0
      t.timestamps
    end
  end
end
