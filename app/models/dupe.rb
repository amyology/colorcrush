class Dupe < ActiveRecord::Base

  belongs_to :product, foreign_key: 'secondary_id'
  has_many :votes
  has_many :tags
  
end
