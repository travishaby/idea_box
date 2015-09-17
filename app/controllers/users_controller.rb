class UsersController < ApplicationController

  def index
    redirect_to new_user_path
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Invalid login, please try again."
      redirect_to new_user_path
    end
  end

private

    def user_params
      params.require(:user).permit(:username, :password)
    end

end
