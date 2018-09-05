class SessionsController < ApplicationController
  def new
  end
  
  def create
    login_info = params[:session]
    user = User.find_by(email: login_info[:email].downcase)
    if user && user.authenticate(login_info[:password])
      log_in(user)
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_to user
      flash[:success] = "Login success!!"
    else
      flash.now[:danger] = "Invalid email or password!!"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
