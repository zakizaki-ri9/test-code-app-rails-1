module SessionsHelper

  # ログイン処理
  ## session[:user_id]にログイン時のユーザーIDを保持させておく
  def log_in(user)
    session[:user_id] = user.id
  end

  # ログイン中のユーザーオブジェクトを取得
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ログイン中かチェック
  def logged_in?
    !current_user.nil?
  end

  # ログアウト処理
  def log_out

    # セッションオブジェクトから:user_idを破棄
    session.delete(:user_id)

    # ユーザーオブジェクトをnilで初期化
    @current_user = nil
    
  end
end
