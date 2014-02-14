class UsersController < ApplicationController

before_action :load_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save 
      redirect_to user_path(@user)
    else
      render(:new)
    end
  end

  def edit
    @update_worked = true
    # binding.pry
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
  end

  private 

  def load_user
    return @user = User.find(params[:id])
  end

  def user_params
    return params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end