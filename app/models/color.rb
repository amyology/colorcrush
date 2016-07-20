class Color < ActiveRecord::Base

  validates :red, presence: true
  validates :green, presence: true
  validates :blue, presence: true

  has_many :products

  accepts_nested_attributes_for :products

end
