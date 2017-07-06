class DashboardController < ApplicationController
  require "instagram"
  require 'uri'
  CALLBACK_URL = URI.encode("https://sicpic.herokuapp.com/oauth/callback")

  def index
    # @instagram_connect_url = "https://api.instagram.com/oauth/authorize/?client_id=9104499421d54fd6bf4560ff2817f12d&redirect_uri=#{CALLBACK_URL}&response_type=token"
    if session[:access_token]
      client = Instagram.client(:access_token => session[:access_token])
      @recent_pics = client.user_recent_media
      # byebug
    end
  end

  def instagram_connect
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
    # redirect_to "https://api.instagram.com/oauth/authorize/?client_id=9104499421d54fd6bf4560ff2817f12d&redirect_uri=#{CALLBACK_URL}&response_type=token"
  end

  def instagram_callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token
    puts "=============== #{response.access_token}"
    redirect_to dashboard_path
  end
end
