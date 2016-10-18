require 'test_helper'

class MediaTest < ActiveSupport::TestCase
  test "that upvote increments the votes attribute" do
    vote = media(:nine_stories).votes
    media(:nine_stories).upvote
    assert_equal vote + 1, media(:nine_stories).votes
  end
end
