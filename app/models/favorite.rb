class Favorite < ApplicationRecord
  # アソシエーション
  belongs_to :post_item
  belongs_to :customer
end
