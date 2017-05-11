class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render "users/show"
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def cart
    @cart = current_user.cart
  end

  def friends
    @user = User.find_by(id: params[:user_id])
  end

  def checkout
    @user = current_user
    @user.checkout
    redirect_to '/'
  end

  def clear_cart
    @user = current_user
    @user.clear_cart
    redirect_to '/'
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
