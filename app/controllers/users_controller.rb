class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You are now a Blogger Blogger!!."
      # redirect_to root_path
      redirect_to root_path
    else
      flash[:alert] = "There was a problem saving your account."
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    if @user.save
      flash[:notice] = "Your account was updated successfully."
      redirect_to users_path
    else
      flash[:alert] = "There was a problem updating your account."
      redirect_to edit_users_path
    end
  end


  def destroy
    puts 'HERE I AM'
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User deleted successfully."
    else
      flash[:alert] = "An error occurred."
    end
    redirect_to users_path
  end


  private

  def user_params
    params.require(:user).permit(:email,:password,:fname,:lname,:age)
  end
end
