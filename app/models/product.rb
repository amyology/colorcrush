require "open-uri"

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

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }#, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  attr_reader :image_remote_url

  def image_remote_url=(url_value)
    self.image = URI.parse(url_value)
    @image_remote_url = url_value
  end

end
