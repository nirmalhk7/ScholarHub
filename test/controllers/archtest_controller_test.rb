require 'test_helper'

class ArchtestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get archtest_index_url
    assert_response :success
  end

end
