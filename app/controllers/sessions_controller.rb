
class SessionsController < ApplicationController
  def create
    credentials = request.env['omniauth.auth']['credentials']
    info = request.env['omniauth.auth']['info']
    session[:access_token] = credentials['token']
    session[:access_token_secret] = credentials['secret']
    session[:twitter_handle] = info["nickname"]
    redirect_to show_path, notice: 'Signed in'
  end

  def show
    if session['access_token'] && session['access_token_secret'] && session[:twitter_handle]
      @db_user_obj = User.find_by_twitter_handle(session[:twitter_handle])
      unless @db_user_obj
        @db_user_obj = User.create(
          twitter_handle: session[:twitter_handle],
          access_key: session['access_token'],
          secret_key: session['access_token_secret']
        )
      end
      @user_products = UserProduct.get_user_products(@db_user_obj.id)
    else
      redirect_to failure_path
    end
  end

  def error
    flash[:error] = 'Sign in with Twitter failed'
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Signed out'
  end
end
