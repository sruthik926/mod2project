class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  # def index
  #
  #  render :index
  # end

  def welcome
    render :welcome
  end

  # def login
  #   @user = User.find(params[:id])
  #   render :login
  # end

  def new
   @user = User.new
   render :new
  end

  def login_display
    @user = User.find_by(email: session[:email])
   render :login_display
  end

  # def login
  #   @user = User.find_by(email: params[:user][:email])
  #   render :login_display
  # end

  def create
   @user = User.create(user_params)
   if @user.valid?
     render :login_display
   else
     flash[:error] = @user.errors.full_messages
     redirect_to new_user_path
   end
  end

  def show
   render :show
  end

  def edit
   render :edit
  end

  def update
   @user.update(user_params)
   redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'You deleted ur account. YEET!'
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :email, :address_1, :city, :state, :zipcode, :phone, :password, :password_confirmation)

  end


  def find_user
    @user = User.find(params[:id])
  end

end
