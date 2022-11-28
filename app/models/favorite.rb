class Favorite < ApplicationRecord
  # アソシエーション
  belongs_to :post_item
  belongs_to :customer

 # バリデーション
 #一つのお土産に対しては一度しかいいねできない(重複を防ぐ)
  validates:post_item_id,uniqueness:true
end
