class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
    @followings = @user.following_users
    @followers = @user.follower_users
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "success"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def view
    @user = User.find(params[:id])
  end

# ここです
  def followings
  @user = User.find(params[:id])
  @followings = @user.following_users
  end

  def followers
  @user = User.find(params[:id])
  @followers = @user.follower_users
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :area,:profile, :password,:password_confirmation)
  end
end
