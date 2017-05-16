class SessionsController < ApplicationController
  def new

 end

 def create
   @user = User.where(email: params[:email]).first
   if @user && @user.password == params[:password]
     session[:user_id] = @user.id
     puts 'SessionStart'+'@'*45
     flash[:notice] = "Logged in"
     redirect_to root_path
   else
     puts 'X'*30
     flash[:alert] = "Incorrect email or password"
     redirect_to login_path
   end
 end

 def destroy
   session[:user_id] = nil
   puts 'SessionEnd'+'@'*45
   flash[:notice] = "Logged out successfully"
   redirect_to root_path
 end
end
