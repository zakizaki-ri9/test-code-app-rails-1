module SessionsHelper

  # ログイン処理
  ## session[:user_id]にログイン時のユーザーIDを保持させておく
  def log_in(user)
    session[:user_id] = user.id
  end

  # ログイン中のユーザーオブジェクトを取得
  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    elsif
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        login user
        @current_user = user
      end
    end
  end

  # ログイン中かチェック
  def logged_in?
    !current_user.nil?
  end

  # セッション破棄
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # ログアウト処理
  def log_out
    # cookieからユーザー情報破棄
    forget(current_user)
    # セッションオブジェクトから:user_idを破棄
    session.delete(:user_id)
    # ユーザーオブジェクトをnilで初期化
    @current_user = nil
  end

  # セッションの永続化
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
end
