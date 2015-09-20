class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_ideas_path(@user)
    elsif @user && !@user.authenticate(params[:session][:password])
      flash[:error] = "Incorrect password, please try again."
      redirect_to login_path
    else
      flash[:error] = "Account not registered. Please create an account"
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
