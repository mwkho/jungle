class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    @user = User.find_by_email(params[:email])
    #  proceed to login if found user
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to :root
    else
      # redirect user to log in page if log in failed
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    # session[:user_id] = null
    redirect_to '/login'
  end

end
