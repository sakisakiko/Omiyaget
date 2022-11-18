class Category < ApplicationRecord
 # アソシエーション
 has_many :post_items, dependent: :destroy
 
 #バリデーション
 validates:name,presence:true
   
end

