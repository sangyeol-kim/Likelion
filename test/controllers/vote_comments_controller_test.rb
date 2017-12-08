require 'test_helper'

class VoteCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get vote_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get vote_comments_destroy_url
    assert_response :success
  end

end
