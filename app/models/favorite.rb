class Favorite < ApplicationRecord
  # アソシエーション
  belongs_to :post_item
  belongs_to :customer

 # バリデーション
 #ユーザーは一つのお土産に対しては一度しかいいねできない(重複を防ぐ)
  validates_uniqueness_of :post_item_id, scope: :customer_id
end
