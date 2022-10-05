class CreatePostItems < ActiveRecord::Migration[6.1]
  def change
    create_table :post_items do |t|
      t.integer :customer_id, null: false, default: ""
      t.integer :category_id, null: false, default: ""
      t.string :name, null: false, default: ""
      t.integer :image_id, null: false, default: ""
      t.text :review, null: false, default: ""
      t.string :evaluation, null: false, default: ""
      t.string :price, null: false, default: ""
      t.string :shop, null: false, default: ""
      t.boolean :integer, null: false, default: "1"
      t.timestamps
    end
  end
end
