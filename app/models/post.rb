class Post < ActiveRecord::Base
  validates_presence_of :name, :email, :body
  
  default_scope :order => "created_at DESC, id DESC"
end
