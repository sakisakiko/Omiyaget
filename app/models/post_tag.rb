class PostTag < ApplicationRecord
  # アソシエーション
  belongs_to :post_item
  belongs_to :tag
  
end
