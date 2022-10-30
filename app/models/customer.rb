class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # アソシエーション
  has_many :post_items,dependent: :destroy
  has_many :bookmarks,dependent: :destroy
  has_many :post_comment,dependent: :destroy
  has_many :favorites,dependent: :destroy

  has_many :relationships,dependent: :destroy, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower


  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following


  #画像表示に必要な記述
  has_one_attached:profile_image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   #ゲストユーザーのemailとpasswordを設定
   def self.guest
     find_or_create_by(email: 'guest@examle.com', prefecture: 1, gender: 2,introduction: "") do |customer|
       customer.password = SecureRandom.urlsafe_base64
    end
   end


    #フォローされているか否かを判定するメソッド
    def is_following_by?(customer)
        reverse_of_relationships.find_by(following_id: customer.id).present?
    end


   #バリデーション
  validates:introduction,length: {maximum: 200} #自己紹介（２００字以内）

  #出身地の都道府県:enum管理
   enum prefecture:{
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
     沖縄県:47,非公開:48
   }


  # 性別:enum管理
  # （unselected:--選択してください--（未選択）、male:男性、female:女性、unanswer:非公開）
  enum gender:{unselected:0,male:1,female:2,unanwer:3}

  # 会員ステータス:enum管理
  # enrolled:有効、deleted:退会、stop:利用停止中
  enum status:{enrolled:1, deleted:2, stop:3}


  #プロフィール画像が設定されていないとき、デフォルトの画像が設定される
  def  get_profile_image(width,height)
    unless profile_image.attached?
      file_path=Rails.root.join('app/assets/images/user_icon.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end

end

