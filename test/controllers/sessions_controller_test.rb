require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

    def setup
        @user = User.create(username: "user", password: "user")
    end

    test "can get login page" do
        get login_path
        assert_template 'sessions/new'
        assert_response :success
    end

    test "show login page given incorrect login details" do
        get login_path
        post login_path, params: { session: { username: "amy", password: "amy"}}
        assert_template 'sessions/new'
        assert_select 'div.error'
    end

    test "show chatroom index page given correct login details" do
        get login_path
        post login_path, params: { session: { username: @user.username, password: @user.password}}
        follow_redirect!
        assert_template 'chatrooms/index'
        assert_select 'div.positive'
        assert session[:user_id] == @user.id
    end

    test "able to log out" do
        get login_path
        post login_path, params: { session: { username: @user.username, password: @user.password}}
        delete login_path
        assert session[:user_id] == nil
    end
end