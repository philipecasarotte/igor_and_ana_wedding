class Admin::ImageGalleriesController < Admin::AdminController
  
  cache_sweeper :image_gallery_sweeper
  edit.before{expire_page "/fotos/#{object.permalink}"}
  create.wants.html {redirect_to(collection_url)}
  update.wants.html {redirect_to(collection_url)}
  
  include Order
end
