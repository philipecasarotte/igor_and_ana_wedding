require 'test_helper'

class Admin::PostsControllerTest < ActionController::TestCase

  def setup
    @controller = Admin::PostsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as(:admin)
  end
  
  context "Create" do
    context "an invalid post" do
      setup do
        Post.any_instance.stubs(:valid?).returns(false)
        post :create
      end
      should_render_template "new"
    end

    context "a valid Post" do
      setup do
        Post.any_instance.stubs(:valid?).returns(true)
        post :create, :post_gallery_id => @parent_object
      end
      should_redirect_to("list of Posts") { admin_posts_path }
    end
  end
  
  context "Update" do
    context "an invalid Post" do
      setup do
        Post.any_instance.stubs(:valid?).returns(false)
        post :update, :id => posts(:one).id
      end
      should_render_template "edit"
    end

    context "a valid Post" do
      setup do
        Post.any_instance.stubs(:valid?).returns(true)
        post :update, :id => posts(:one).id
      end
      should_redirect_to("list of Posts") { admin_posts_path}
    end
  end
  
end
