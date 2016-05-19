require 'test_helper'

class DeviceManageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get device_manage_index_url
    assert_response :success
  end

end
