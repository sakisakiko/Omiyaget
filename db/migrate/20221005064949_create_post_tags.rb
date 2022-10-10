class CreatePostTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tags do |t|
      t.references :post_item, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
    # 同じタグを２回保存するのは出来ないようになる(重複をさける)
    add_index :post_tags, [:post_item_id, :tag_id], unique: true
  end
end
