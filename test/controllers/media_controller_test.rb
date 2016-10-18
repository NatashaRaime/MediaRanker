require 'test_helper'

class MediaControllerTest < ActionController::TestCase
  test "that upvote increments by one each time" do
    vote = media(:nine_stories).votes
    post :votes, media(:nine_stories).url_params

    assert_equal vote + 1, media(:nine_stories).reload.votes
  end

  
end
