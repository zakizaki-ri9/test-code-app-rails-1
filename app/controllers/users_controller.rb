# frozen_string_literal: true

class UsersController < ApplicationController

  include Pagy::Backend

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user, only: :destroy

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Create success!!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Update success!!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @pagy, @users = pagy(User.all)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted!!'
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please login or sign up!!'
      redirect_to(login_url)
    end
  end

  def admin_user
    flash[:danger] = 'You do not have permission to delete'
    redirect_to(root_url) unless current_user.admin?
  end

end
