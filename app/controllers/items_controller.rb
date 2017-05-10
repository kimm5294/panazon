class ItemsController < ApplicationController
  def import
    Item.import(params[:file])

    redirect_to root_path
  end

  def show
    @item = Item.find_by(id: params[:id])
  end
end
