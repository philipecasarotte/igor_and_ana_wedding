class Image < ActiveRecord::Base
  validates_presence_of :name
  
  belongs_to :image_gallery
  
  has_attached_file :image,
                    :styles => {:thumb => "100x100#", :image => "728x456>"},
                    :path => ":rails_root/public/system/:class/:id/:style/:basename.:extension",
                    :url => "/system/:class/:id/:style/:basename.:extension",
                    :default_url => ""

  validates_attachment_presence :image
  
  default_scope :order => "position, id DESC"
end
