class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    render :new
  end

  def create

    @user = User.find_by(email: params[:email])

    # get that user record from DB
    # authenticate this user; determine if they provided the correct pw

    if @user && @user.authenticate(params[:password])
      # once we have found the user, create a new session for them
      session[:email] = @user.email
      # redirect_to user_path(@user)
      redirect_to @user

    else
      flash[:notice] = 'Invalid email or password'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:email)
    # session[:user_id] = nil
    flash[:notice] = "You have been logged out. Come back again!"
    redirect_to login_path
  end
end
