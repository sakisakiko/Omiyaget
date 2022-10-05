class PostComment < ApplicationRecord
  # アソシエーション
  belongs_to :post_item
  belongs_to :customer
  
  # バリデーション
  validates:comment, presence: true,length: {maximum: 140}
end
