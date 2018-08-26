require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "ExampleUser", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  # name
  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  # email
  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    # %w
    #  パーセント記法というもの
    #  %w[]内で半角スペースで区切ると型文字列の配列が作成できる
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    # 配列分チェック
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      # どのメールアドレスでエラーとなったかを出力
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@Ex.CoM"
    @user.email = mixed_case_email
    @user.save
    # model.reload => レコード再取得（Userのbefore_saveオプションによるdowncase保存確認のため）
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
