class TransactionsController < ApplicationController

  def destroy
    @purchase = Transaction.find_by(id: params[:id])
    @purchase.destroy
    redirect_to "/users/#{current_user.id}/cart"
  end

  def create
    Transaction.create!(transaction_params)
    redirect_to "/users/#{current_user.id}/cart"
  end

  private
    def transaction_params
      params.require(:transaction).permit(:buyer_id, :item_id, :quantity)
    end
end
