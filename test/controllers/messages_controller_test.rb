require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
    
    def setup
        @user = User.create(username: "user", password: "password")
    end

    test "can add new message" do
        sign_in_as @user, "password"
        get root_path
        assert_difference 'Message.count', 1 do
            post message_path, params: { message: { body: "new message" } }
            follow_redirect!
        end
        assert_match "new message", response.body
    end
end