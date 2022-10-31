# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 Admin.create(email: 'hanada@dmm.com', password:'12g1035')

 BuyPrefecture.create!(
   [
    {id: 1, name: '北海道'}, {id: 2, name: '青森県'}, {id: 3, name: '岩手県'},
    {id: 4, name: '宮城県'}, {id: 5, name: '秋田県'}, {id: 6, name: '山形県'},
    {id: 7, name: '福島県'}, {id: 8, name: '茨城県'}, {id: 9, name: '栃木県'},
    {id: 10, name: '群馬県'}, {id: 11, name: '埼玉県'}, {id: 12, name: '千葉県'},
    {id: 13, name: '東京都'}, {id: 14, name: '神奈川県'}, {id: 15, name: '新潟県'},
    {id: 16, name: '富山県'}, {id: 17, name: '石川県'}, {id: 18, name: '福井県'},
    {id: 19, name: '山梨県'}, {id: 20, name: '長野県'}, {id: 21, name: '岐阜県'},
    {id: 22, name: '静岡県'}, {id: 23, name: '愛知県'}, {id: 24, name: '三重県'},
    {id: 25, name: '滋賀県'}, {id: 26, name: '京都府'}, {id: 27, name: '大阪府'},
    {id: 28, name: '兵庫県'}, {id: 29, name: '奈良県'}, {id: 30, name: '和歌山県'},
    {id: 31, name: '鳥取県'}, {id: 32, name: '島根県'}, {id: 33, name: '岡山県'},
    {id: 34, name: '広島県'}, {id: 35, name: '山口県'}, {id: 36, name: '徳島県'},
    {id: 37, name: '香川県'}, {id: 38, name: '愛媛県'}, {id: 39, name: '高知県'},
    {id: 40, name: '福岡県'}, {id: 41, name: '佐賀県'}, {id: 42, name: '長崎県'},
    {id: 43, name: '熊本県'}, {id: 44, name: '大分県'}, {id: 45, name: '宮崎県'},
    {id: 46, name: '鹿児島県'}, {id: 47, name: '沖縄県'}
    ]
  )

  Category.create!(
  [
    {id: 1, name: "食べ物"},
    {id: 2,name: "お菓子"},
    {id: 3,name: "飲み物"},
    {id: 4,name: "雑貨"},
    {id: 5,name: "ファッション"},
    {id: 6,name: "その他"}
  ])

  Customer.create!(
  [
    {email: 'hanasaki@test.com',
    name: '花咲',
    password: '12g1035',
    prefecture: 40,
    introduction: "福岡県出身です。絶景を巡るのが好きです。よろしくお願いします！",
    gender: 2,
    status: 1,
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
    },

    {email: 'taro@test.com',
    name: 'タロウ', password: '12g1035',
    prefecture: 13,introduction: "一人旅が好きで日本全国巡ってます。よろしくお願いします。",
    gender: 1,
    status: 1,
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
    },

    {email: 'aoi@test.com',
    name: '葵',
    password: '12g1035',
    prefecture: 2,
    introduction: "写真を撮るのが好きです♪全国のお土産を沢山知れたら嬉しいです！",
    gender: 2,
    status: 1,
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
    },

    {email: 'yuta@test.com',
    name: '悠太',
    password: '12g1035',
    prefecture: 34,
    introduction: "食べ歩きにハマってます。各地の名産など共有できたらと思います。",
    gender: 1,
    status: 1,
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")
    },

    {email: 'momo@test.com',
    name: 'MOMO',
    password: '12g1035',
    prefecture: 20,
    introduction: "自然豊かな場所が好き♪その土地ならではのものを見つけられたらと思います!",
    gender: 2,
    status: 1,
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")
    },
    
    {email: 'yamada@test.com',
    name: '山田',
    password: '12g1035',
    prefecture: 42,
    introduction:"山田と申します。宜しくお願いします。",
    gender: 1,
    status: 1,
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")
    },
    
    {email: 'sakura@test.com',
    name: 'さくら',
    password: '12g1035',
    prefecture: 42,
    introduction: "友人とよく旅行に行きます！お土産を購入するのも好きです。宜しくお願いします♪",
    gender: 2,
    status: 1,
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")
    },
    
    {email: 'yukia@test.com',
    name: 'ユウキ',
    password: '12g1035',
    prefecture: 6,
    introduction: "宜しくお願いします。",
    gender: 1,
    status: 1,
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")
    },
    
    {email: 'maeda@test.com',
    name: '前田響',
    password: '12g1035',
    prefecture: 15,
    introduction: "仕事で色々な場所に行きます。全国の色々なお土産を知れたら良いなと思います。",
    gender: 1,
    status: 1,
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")
    },
    
    {email: 'mido@test.com',
    name: 'MIDO',
    password: '12g1035',
    prefecture: 30,
    introduction: "買い物がすきです。宜しくおねがしいます！",
    gender: 2,
    status: 1,
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")
    },
    
    {email: 'hanako@test.com',
    name: 'ハナコ',
    password: '12g1035',
    prefecture: 4,
    introduction: "宜しくおねがします♪",
    gender: 2,
    status: 1,
    profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user11.jpg"), filename:"sample-user11.jpg")
    },
  ]
)


PostItem.create!(
  [
    {customer_id: 1,
    category_id: 2,
    name: "星果庵　金平糖（ほうじ茶）",
    review: "ほうじ茶の香ばしい香りがして美味しいです！",
    evaluation: 5,
    price: 594,
    shop: "宇治園　心斎橋本店",
    buy_prefecture_id: 27,
    release: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-image1.jpg"), filename:"sample-post-image1.jpg")
    },

    {customer_id: 2,
    category_id: 2,
    name: "【天明堂】鳳梨萬頭　１０個入",
    review: "パイナップルの味がしてすごく美味しかったです",
    evaluation: 5,
    price: 1458,
    shop: "八丁堀本店地階 広島みやげ　心斎橋本店",
    buy_prefecture_id: 34,
    release: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-image2.jpg"), filename:"sample-post-image2.jpg")
    },

    {customer_id: 2,
    category_id: 4,
    name: "コースター",
    review: "小樽のキャンドルのお店にて。木の作りと温かみのあるデザインが気に入っています",
    evaluation: 5,
    price: 600,
    shop: "小樽キャンドル工房",
    buy_prefecture_id: 1,
    release: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-image3.jpg"), filename:"sample-post-image3.jpg")
    },

    {customer_id: 3,
    category_id: 2,
    name: "萩の月",
    review: "職場へのお土産と家用に買いました。美味しかったです",
    evaluation: 4,
    price: 2160,
    shop: "おみやげ処せんだい1号店",
    buy_prefecture_id: 45,
    release: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-image4.jpg"), filename:"sample-post-image4.jpg")
    },

    {customer_id: 4,
    category_id: 1,
    name: "うまか玉手箱",
    review: "色々な味付けの明太子がセットなのが良いです！ペースト上ですがご飯によく合います！",
    evaluation: 5,
    price: 1340,
    shop: "博多阪急地下　辛子明太子売場",
    buy_prefecture_id: 40,
    release: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-image5.jpg"), filename:"sample-post-image5.jpg")
    },

    {customer_id: 4,
    category_id: 2,
    name: "佐世保ちょこ煉瓦物語",
    review: "濃厚なチョコレートのが最高に美味しいです！",
    evaluation: 5,
    price: 1490,
    shop: "さいかい堂 もみじが丘店",
    buy_prefecture_id: 42,
    release: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-image6.jpg"), filename:"sample-post-image6.jpg")
    },

    {customer_id: 5,
    category_id: 2,
    name: "りくろーおじさんのチーズケーキ",
    review: "濃厚なチョコレートのが最高に美味しいです！",
    evaluation: 5,
    price: 865,
    shop: "JR新大阪駅中央口",
    buy_prefecture_id: 27,
    release: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-image7.jpg"), filename:"sample-post-image7.jpg")
    },

    {customer_id: 5,
    category_id: 3,
    name: "山廃純米酒　飛良泉（720ml)",
    review: "大吟醸だとやや濃厚に感じますが、さらっとしていて飲みやすかったです。",
    evaluation: 5,
    price: 1760,
    shop: "菅久商店",
    buy_prefecture_id: 5,
    release: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-image8.jpg"), filename:"sample-post-image8.jpg")
    },

    {customer_id: 5,
    category_id: 4,
    name: "丸亀　組うちわ",
    review: "伝統工芸の丸亀うちわです。涼むのに使用するのも良いですが形と絵柄がお気に入りなので飾っています",
    evaluation: 5,
    price: 2178,
    shop: "おみやげshop MIU",
    buy_prefecture_id: 37,
    release: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-image9.jpg"), filename:"sample-post-image9.jpg")
    },

    {customer_id: 5,
    category_id: 2,
    name: "ふくやラスク明太味セット",
    review: "シュガーとガーリックの2種類の明太味のラスクで、とても美味しいです！写真には載っていないのですが外のパッケージもかわいく、コースターにもなります",
    evaluation: 5,
    price: 1100 ,
    shop: "福岡空港",
    buy_prefecture_id: 40,
    release: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-image10.jpg"), filename:"sample-post-image10.jpg")
    },

    {customer_id: 5,
    category_id: 4,
    name: "小樽硝子　花瓶",
    review: "透明感のある鮮やかな硝子がとても綺麗で気に入っています",
    evaluation: 5,
    price: 2750,
    shop: "GLASS GALLERY",
    buy_prefecture_id: 1,
    release: true,
    image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post-image11.jpg"), filename:"sample-post-image11.jpg")
    },

  ]
)




# PostTag.create!(
#   [
#     {post_item_id: 1,tag_id: 1},
#     {post_item_id: 1,tag_id: 2},
#     {post_item_id: 2,tag_id: 1},
#     {post_item_id: 3,tag_id: 3},
#     {post_item_id: 4,tag_id: 1},
#     {post_item_id: 5,tag_id: 4}
#   ]
#   )

#   Tag.create!(
#   [
#     {id: 1,tag_name: "お菓子"},
#     {id: 2,tag_name: "金平糖"},
#     {id: 3,tag_name: "コースター"},
#     {id: 4,tag_name: "明太子"}

#   ]
#   )
