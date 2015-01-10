class TransactionsController < ApplicationController
  protect_from_forgery except: :create

  def create
    transaction = Transaction.new(transaction_params)
    if transaction.save
      render json: transaction
    else
      render json: { errors: transaction.errors }, status: 422
    end

  end

  def index
    @transactions = Transaction.all
  end

  def transaction_params
    params.require(:transaction).permit(
      :sender_id,
      :receiver_id,
      :amount,
      :signature
    )
  end
end
