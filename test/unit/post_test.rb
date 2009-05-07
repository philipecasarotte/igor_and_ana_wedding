require 'test_helper'

class PostTest < ActiveSupport::TestCase
  context "A Post" do
    should_validate_presence_of :name, :email, :body
  end
end
