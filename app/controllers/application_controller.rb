class ApplicationController < ActionController::Base
  before_action :authenticate_user


  private
  
    def authenticate_user
      client_id = ENV['FOURSQUARE_CLIENT_ID']
      redirect_uri = CGI.escape("http://localhost:3000/test")
      foursquare_url = "https://foursquare.com/oauth2/authenticate?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"
      redirect_to foursquare_url unless logged_in?
    end
  
    def logged_in?
      !!session[:token]
    end
end