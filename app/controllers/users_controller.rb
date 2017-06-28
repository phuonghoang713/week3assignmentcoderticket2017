class UsersController < ApplicationController

  def index
    @users = User.all.shuffle
  end

  def new
    @user = User.new(email: params[:email])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.name}"
      # assign session to keep login for register user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
