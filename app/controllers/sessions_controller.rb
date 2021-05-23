class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
 
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end
end
