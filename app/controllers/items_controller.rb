class ItemsController < ApplicationController
  def import
    @user = User.find_by(id: session[:user_id])
    if !!params[:file]
      Item.import(params[:file].path, session[:user_id])
      redirect_to @user
    else
      @errors = ["Please choose a CSV file to import"]
      render 'users/show'
    end
  end

  def show
    @item = Item.find_by(id: params[:id])
  end
end
