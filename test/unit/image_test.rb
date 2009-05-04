require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  context "A Image" do
    should_validate_presence_of :name
    should_belong_to :image_gallery
    should_have_attached_file :image
    should_validate_attachment_presence :image
  end
end
