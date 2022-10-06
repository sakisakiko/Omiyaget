class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  # アソシエーション
  has_many :post_items,dependent: :destroy
  has_many :bookmarks,dependent: :destroy
  has_many :post_comment,dependent: :destroy
  has_many :favorites,dependent: :destroy
  
  #画像表示に必要な記述 
  has_one_attached:image
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
   #バリデーション
  validates:introduction,length: {maximum: 200} #自己紹介（２００字以内）
  
  
  
  #プロフィール画像が設定されていないとき、デフォルトの画像が設定される
  def  get_profile_image(width,height)
    unless profile_image.attached?
      file_path=Rails.root.join('app/assets/images/default（画像の名前）')
      profile_image.attach(io: File.open(file_path), filename: 'default-profile-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
