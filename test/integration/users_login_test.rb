require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "login with invalid information" do
    get login_path
    assert_template "sessions/new"
    post login_path, params: {
      session: {
        email: "",
        password: ""
      }
    }

    # ログイン失敗＆フラッシュメッセージの確認
    assert_template "sessions/new"
    assert_not flash.empty?

    # フラッシュメッセージが消えているかの確認
    get root_path
    assert flash.empty?
  end

end
