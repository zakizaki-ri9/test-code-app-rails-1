require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  # ページ「home」のリンクが意図した通りに登録されているかを確認する
  test "home page links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
  end

end
