class ApplicationController < ActionController::Base
  require "mini_magick"
  include SessionsHelper

  def login_required
    redirect_to "/" unless current_user
  end

  def forbid_login_user
    redirect_to "/" if current_user
  end
  def admin_required
    redirect_to "/" if current_user.id != @picture.user_id
  end
end

