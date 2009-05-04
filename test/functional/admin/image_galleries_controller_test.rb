require 'test_helper'

class Admin::ImageGalleriesControllerTest < ActionController::TestCase

  def setup
    @controller = Admin::ImageGalleriesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as(:admin)
  end
  
  context "Create" do
    context "an invalid image gallery" do
      setup do
        ImageGallery.any_instance.stubs(:valid?).returns(false)
        post :create
      end
      should_render_template "new"
    end

    context "a valid image gallery" do
      setup do
        ImageGallery.any_instance.stubs(:valid?).returns(true)
        post :create
      end
      should_redirect_to("list of image galleries") { admin_image_galleries_path }
    end
  end
  
  context "Update" do
    context "an invalid image gallery" do
      setup do
        ImageGallery.any_instance.stubs(:valid?).returns(false)
        post :update, :id => image_galleries(:one)
      end
      should_render_template "edit"
    end

    context "a valid image gallery" do
      setup do
        ImageGallery.any_instance.stubs(:valid?).returns(true)
        post :update, :id => image_galleries(:one)
      end
      should_redirect_to("list of image galleries") { admin_image_galleries_path }
    end
  end

end
