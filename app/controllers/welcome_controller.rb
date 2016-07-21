class WelcomeController < ApplicationController
  def index
    if session['access_token'] && session['access_token_secret'] && session[:twitter_handle]
      @db_user_obj = User.find_by_twitter_handle(session[:twitter_handle])
      redirect_to show_path
    end
  end
end
