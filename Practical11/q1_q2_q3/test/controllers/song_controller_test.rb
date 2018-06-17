require 'test_helper'

class SongControllerTest < ActionController::TestCase
  test "should get ownedSongs" do
    get :ownedSongs
    assert_response :success
  end

end
