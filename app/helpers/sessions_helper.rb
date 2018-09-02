module SessionsHelper

  # ログイン処理
  ## session[:user_id]にログイン時のユーザーIDを保持させておく
  def log_in(user)
    session[:user_id] = user.id
  end
end
