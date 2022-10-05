class CreatePostItems < ActiveRecord::Migration[6.1]
  def change
    create_table :post_items do |t|

      t.timestamps
    end
  end
end
