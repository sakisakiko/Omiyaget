class Tag < ApplicationRecord
  #アソシエーション
  has_many :post_tags,dependent: :destroy
end
