class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wishlists
  has_many :traincases
  has_many :products, through: :wishlists
  has_many :owned_products, through: :traincases, source: :product
  has_many :votes
end
