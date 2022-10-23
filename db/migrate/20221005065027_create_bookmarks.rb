class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.integer :customer_id, null: false, default: 0
      t.integer :post_item_id, null: false, default: 0
      t.timestamps
    end
  end
end
