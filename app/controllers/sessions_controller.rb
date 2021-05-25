class SessionsController < ApplicationController
  before_action :forbid_login_user, only: [:new, :create]
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      @error_message = "メールアドレス もしくは パスワードが違います"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    @error_message = "ログアウトしました"
    render :new
  end
end
