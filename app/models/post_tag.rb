class PostTag < ApplicationRecord
  # アソシエーション
  belongs_to :post_item
  belongs_to :tag

  # バリデーション
  validates :post_item_id, presence: true
  validates :tag_id, presence: true

end
