require 'test_helper'

class ImageGalleryTest < ActiveSupport::TestCase
  context "A Image Gallery" do
    should_validate_presence_of :name
    should_have_many :images
  end
end
