class Category < ApplicationRecord
 # アソシエーション
 has_many :post_items, dependent: :destroy
end
