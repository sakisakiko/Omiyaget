class Bookmark < ApplicationRecord
  # アソシエーション
  belongs_to :customer
  belongs_to :post_item

  #バリデーション：ブックマークの重複を防ぐ
  validates :customer_id, uniqueness: { scope: :post_item_id }


end
