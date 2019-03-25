class UsersController < ApplicationController
   before_action :find_user, only: [:show, :login, :edit, :update]
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

  def create
   @user = User.create(user_params)
   redirect_to user_path(@user.id)
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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :email, :address_1, :city, :state, :zipcode, :phone)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
