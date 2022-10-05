class Bookmark < ApplicationRecord
  # アソシエーション
  belongs_to :customer
  belongs_to :post_item
end
