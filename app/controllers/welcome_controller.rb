class WelcomeController < ApplicationController
  def index
    session['access_token'] = "3163517532-EhsW9yjxQBoUaUoXJQoHF0779iMvFPywnTJ4MCb"
    session['access_token_secret'] = "1JRSuPN6BKm8ZnwH3HpylY1iJrom5PqqZOutKk0CLhWEg"
    session[:twitter_handle] = "saini_jyotii"
    if session['access_token'] && session['access_token_secret'] && session[:twitter_handle]
      @db_user_obj = User.find_by_twitter_handle(session[:twitter_handle])
      redirect_to show_path
    end
  end
end
