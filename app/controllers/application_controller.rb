class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    # dashboard_path
    callback_url = "https://sicpic.herokuapp.com/oauth/callback"
    Instagram.authorize_url(:redirect_uri => callback_url)
  end
  def after_sign_out_path_for(resource_or_scope)
    user_session_path
  end
end
