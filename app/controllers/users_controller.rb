class UsersController < ApplicationController

  before_action :load_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, :authorize, only: [:edit, :update]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    # if @user.save 
    #   redirect_to user_path(@user)
    # else
    #   render(:new)
    # end

    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def edit
    @update_worked = true
  end

  def update
    @update_worked = @user.update(user_params)

    if @update_worked
      redirect_to user_path(@user)
    else
      render(:edit)
    end
    
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private 

  def load_user
    return @user = User.find(params[:id])
  end

  def user_params
    return params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :password_digest)
  end

  def authenticate
    unless logged_in?
      redirect_to login_path
    end
  end

  def authorize
    unless current_user == @user
      redirect_to login_path
    end
  end

end