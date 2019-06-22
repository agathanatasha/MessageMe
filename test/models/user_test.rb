require 'test_helper'

class UserTest < ActiveSupport::TestCase
    def setup
        @user = User.new(username: "test_user", password: "test")
    end

    test "username should be present" do
        @user.username = ""
        assert_not @user.valid?
    end

    test "password should be present" do
        @user.password = nil
        assert_not @user.valid?
    end

    test "user should be valid" do
        assert @user.valid?
    end

    test "username is case insensitive" do
        @user.save
        @user2 = User.new(username: "TesT_usEr", password: "second")
        assert_not @user2.valid?
    end

    test "username cannot be too short" do
        @user.username = "a" * 2
        assert_not @user.valid?
    end

    #TODO
end