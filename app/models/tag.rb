class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy, foreign_key: 'tag_id'
  
  # タグは複数の投稿(post_items)を持つ　それは、post_tagsを通じて参照できる
  has_many :post_items,through: :post_tags
  
  # バリデーション（重複しないかつ空でない）
  validates :name, uniqueness: true, presence: true
end
