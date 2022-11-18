class BuyPrefecture < ApplicationRecord

# アソシエーション
 has_many :post_items, dependent: :destroy

end
