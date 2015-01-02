class TransactionsController < ApplicationController
  protect_from_forgery except: :create

  def create
    sender = Account.find_by_address(params[:sender])
    receiver = Account.find_by_address(params[:receiver])

    transaction = Transaction.new(
      sender: sender,
      receiver: receiver,
      amount: params[:amount],
      signature: params[:signature]
    )


    if transaction.save
      render json: transaction
    else
      render json: { errors: transaction.errors }, status: 422
    end

  end

  def index
    @transactions = Transaction.all
  end
end
