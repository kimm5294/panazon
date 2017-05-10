class UsersController < ApplicationController
  def import
    Item.import(params[:file])

    redirect_to root_path
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    # @user = User.new
  end

  def create
    # render plain: user_params.inspect
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render "users/show"
    else
      @errors = @user.errors.full_messages
      render 'new'
    end

  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
