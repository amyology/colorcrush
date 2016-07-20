class Product < ActiveRecord::Base

  validates :name, presence: true
  validates :brand, presence: true
  validates :product_type, presence: true
  validates :image, presence: true
  validates_uniqueness_of :name, :scope => :brand

  has_many :traincases
  has_many :wishlists
  has_many :users, through: :wishlists
  has_many :same_users, through: :traincases, source: :user
  has_many :votes

  has_many :dupes, foreign_key: "primary_id"
  has_many :products, through: :dupes

  has_many :tags, through: :dupes

  belongs_to :color

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
