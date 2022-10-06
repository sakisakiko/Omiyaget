class PostItem < ApplicationRecord
  # アソシエーション
  belongs_to :customer
  belongs_to :category
  has_many :bookmarks, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :post_comments,dependent: :destroy
  
  # 画像を保つための記述
  has_one_attached :image
  
  #バリデーション
   validates:name,presence:true
   validates:price,presence:true
   validates:shop,presence:true
   validates:review,length: {maximum: 300}
   
  
  #お土産の商品画像が投稿されていなかった場合デフォルト画像を設定 
  def  get_image(width,height)
    unless image.attached?
      file_path=Rails.root.join('app/assets/images/default-image.jpeg（画像の名前）')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
        
  end
  
end
