require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @controller = PostsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
 
  context "Posts controller" do
    context "get the index" do
      setup do
        get :index
      end

      should_assign_to(:posts) { Post.all }
      should_assign_to(:page) { Page.find_by_permalink("mensagens") }
      should_respond_with :success
      should_render_template :index
    end
  end
end
