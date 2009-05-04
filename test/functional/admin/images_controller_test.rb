
require 'test_helper'

class Admin::ImagesControllerTest < ActionController::TestCase

  def setup
    @controller = Admin::ImagesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @parent_object = image_galleries(:one)
    login_as(:admin)
  end
  
  context "Create" do
    context "an invalid image" do
      setup do
        Image.any_instance.stubs(:valid?).returns(false)
        post :create, :image_gallery_id => @parent_object
      end
      should_render_template "new"
    end

    context "a valid Image" do
      setup do
        Image.any_instance.stubs(:valid?).returns(true)
        post :create, :image_gallery_id => @parent_object
      end
      should_redirect_to("list of Images") { admin_image_gallery_images_path(@parent_object) }
    end
  end
  
  context "Update" do
    context "an invalid Image" do
      setup do
        Image.any_instance.stubs(:valid?).returns(false)
        post :update, :id => images(:one).id, :image_gallery_id => image_galleries(:one).id
      end
      should_render_template "edit"
    end

    context "a valid Image" do
      setup do
        Image.any_instance.stubs(:valid?).returns(true)
        post :update, :id => images(:one).id, :image_gallery_id => image_galleries(:one).id
      end
      should_redirect_to("list of Images") { admin_image_gallery_images_path(@parent_object)}
    end
  end
  
end
