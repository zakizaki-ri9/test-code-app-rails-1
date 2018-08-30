require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do

    # 登録ページへアクセス
    get signup_path

    # Postでエラーとなる登録情報を送信
    #  assert_no_differenceでUserのカウント数が変化しない（登録されない）ことを確認
    assert_no_difference 'User.count' do
      post users_path, params: {
        user: {
          name: "",
          email: "user@invalid",
          password: "foo",
          password_confirmation: "bar"
        }
      }
    end

    # 再び登録ページが表示されているかの確認
    assert_template 'users/new'

  end
  
end