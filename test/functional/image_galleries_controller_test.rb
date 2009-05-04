require 'test_helper'

class ImageGalleriesControllerTest < ActionController::TestCase
  setup do
    @controller = ImageGalleriesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
 
  context "Image Galleries controller" do
    context "get the index" do
      setup do
        get :index
      end

      should_redirect_to("first gallery page") { image_gallery_path(PhotoGallery.first.permalink) }
    end
    

    context "get a specific gallery" do
      setup do
        get :show, :id => image_galleries(:one).permalink
      end

      should_assign_to(:image_galleries) { ImageGallery.all }
      should_assign_to(:page) { Page.find_by_permalink("fotos") }
      should_assign_to(:image_gallery) { ImageGallery.find_by_permalink(image_galleries(:one).permalink, :include => :images) }
      should_respond_with :success
      should_render_template :show
    end
  end
end
