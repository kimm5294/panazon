class TransactionsController < ApplicationController

  def destroy
    @user = current_user
    @purchase = Transaction.find_by(id: params[:id])
    @purchase.destroy
    redirect_to "/users/#{@user.id}/cart"
  end
end
