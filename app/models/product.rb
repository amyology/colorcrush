class Product < ActiveRecord::Base

  validates :name, presence: true
  validates :brand, presence: true
  validates :product_type, presence: true
  validates :image, presence: true

  has_many :traincases
  has_many :wishlists
  has_many :users, through: :wishlists
  has_many :same_users, through: :traincases, source: :user
  has_many :votes

  has_many :dupes, foreign_key: "primary_id"
  has_many :products, through: :dupes

  has_many :tags, through: :dupes

  belongs_to :color

end
