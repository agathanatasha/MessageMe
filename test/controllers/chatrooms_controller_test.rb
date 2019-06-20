require 'test_helper'

class ChatroomsControllerTest < ActionDispatch::IntegrationTest
    test "get root" do
        get root_path
        assert_template 'chatrooms/index'
        assert_response :success
    end
end