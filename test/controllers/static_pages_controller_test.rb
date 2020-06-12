require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'get main' do
    get root_path
    assert_response :success
  end
end
