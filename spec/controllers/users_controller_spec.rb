require 'rails_helper'

# 初めてのRSpecの実装であるため、
# caseは日本語でケースを記述する。

RSpec.describe UsersController, type: :controller do

  describe 'GET #edit' do

    let(:user){ create(:user) }

    # 事前のデータ準備
    before do
      log_in(user)
      get :edit, params: {
        id: user.id
      }
    end

    it '正常なレスポンスを返すこと' do
      expect(response).to be_success
    end
    it 'editテンプレートが選択されていること' do
      expect(response).to render_template :edit
    end
  end

  describe 'DELETE #destroy' do
    
    let(:user){ create(:user) }
    let(:user_admin){ create(:user_admin) }
    
    it '削除できること' do
      log_in(user_admin)
      expect { delete :destroy, params: { id: user_admin.id } }.to change(User, :count)
    end

    it '削除できないこと' do
      log_in(user)
      expect { delete :destroy, params: { id: user.id } }.to_not change(User, :count)
    end
  end

end
