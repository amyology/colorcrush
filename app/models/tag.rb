class Tag < ActiveRecord::Base

  validates :text, presence: true, length: { maximum: 20 }
  
  belongs_to :dupe
  
end
