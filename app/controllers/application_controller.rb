class ApplicationController < ActionController::Base

  include SessionsHelper

  def login_required
    redirect_to "/" unless current_user
  end

  def forbid_login_user
    redirect_to "/" if current_user
  end
end
