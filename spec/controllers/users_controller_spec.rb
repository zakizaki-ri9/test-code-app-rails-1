require 'rails_helper'

# 初めてのRSpecの実装であるため、
# caseは日本語でケースを記述する。

RSpec.describe UsersController, type: :controller do

  describe 'GET #edit' do

    # 事前のデータ準備
    before do
      @user = create(:user)
      post :create, params: {
        user: {
          id: @user.id,
          name: @user.name,
          email: @user.email,
          password: @user.password,
          password_confirmation: @user.password_confirmation
        }
      }
      get :edit, params: {
        id: @user.id
      }
    end

    it "リクエスト200OKであること" do
      expect(response.status).to eq 200
    end
  end

end
