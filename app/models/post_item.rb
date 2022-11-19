class PostItem < ApplicationRecord
  #アソシエーション
    belongs_to :customer
    belongs_to :category
    belongs_to :buy_prefecture
    has_many :bookmarks, dependent: :destroy
    has_many :favorites,dependent: :destroy
    has_many :post_comments,dependent: :destroy

    has_many :post_tags, dependent: :destroy
    has_many :tags,through: :post_tags

  #画像を保つための記述
    has_one_attached :image

  #バリデーション
   validates:name,presence:true
   validates:price,presence:true
   validates:evaluation,presence:true
   validates:shop,presence:true
   validates:review,presence:true
   validates:review,length: {maximum: 200}


  def save_tag(sent_tags)
      # タグが存在していれば(空でなければ）、タグの名前を配列として全て取得
      current_tags=self.tags.pluck(:tag_name) unless self.tags.nil?
      # 現在取得したタグから送られてきたタグを除いてoldtagとする
      old_tags = current_tags - sent_tags
      # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
      new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete  Tag.find_by(tag_name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_item_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_item_tag
    end

  end


  # いいねされたユーザーidがfavoritesテーブルに存在するか確認
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end


  # 既にブックマークをしているかの確認
  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end


 # 購入した店名を登録した際にgeocoderが緯度、経度のカラムに自動的に値を入れる
  geocoded_by :shop
  after_validation :geocode, if: :shop_changed?


  #お土産の商品画像が投稿されていなかった場合デフォルト画像を設定
    def  get_image
    unless image.attached?
      file_path=Rails.root.join('app/assets/images/item_icon.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image
    end

end
