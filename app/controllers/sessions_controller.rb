class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
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
