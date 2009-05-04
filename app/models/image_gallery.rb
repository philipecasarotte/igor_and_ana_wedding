class ImageGallery < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :images
  
  default_scope :order => "position, id DESC"
end
