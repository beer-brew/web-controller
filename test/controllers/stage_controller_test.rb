require 'test_helper'

class StageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stage_index_url
    assert_response :success
  end

end
