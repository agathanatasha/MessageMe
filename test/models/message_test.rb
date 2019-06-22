require 'test_helper'

class MessageTest < ActiveSupport::TestCase
    def setup
        @user = User.create(username: "user", password: "user")
        @message = Message.new(body: "hello world", user: @user)
    end

    test "body should be present" do
        @message.body = ""
        assert_not @message.valid?
    end

    test "user should be present" do
        @message.user = nil
        assert_not @message.valid?
    end

    test "valid message" do
        assert @message.valid?
    end
end
