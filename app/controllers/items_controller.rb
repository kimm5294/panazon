class ItemsController < ApplicationController
  def import
    Item.import(params[:file].path, session[:user_id])

    redirect_to root_path
  end

  def show
    @item = Item.find_by(id: params[:id])
  end
end
