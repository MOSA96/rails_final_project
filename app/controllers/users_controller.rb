class UsersController < ApplicationController
  
  def show 
    @user = User.find(params[:id])
    @transaction = @user.transactions
  end
  
  def new
    @user = User.new 
  end
  
  
  def create 
    @user = User.new(user_params)
    if @user.save 
      log_in @user
      flash[:success] = "Welcome to the Stonks App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :funds,:password,
                                  :password_confirmation, :user_id)
  end
  
end
