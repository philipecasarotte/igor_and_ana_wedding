class ImageGalleriesController < ApplicationController
  
  caches_page :index, :show
  
  def index
    redirect_to image_gallery_path(ImageGallery.first.permalink)
  end

  def show
    @page = Page.find_by_permalink("fotos")
    @image_galleries = ImageGallery.all
    @image_gallery = ImageGallery.find_by_permalink(params[:id], :include => :images)
    @metatag_object = @page
  end
end