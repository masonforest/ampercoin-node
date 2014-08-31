class TransactionsController < ApplicationController
  protect_from_forgery except: :create

  def create
    sender = Address.find_by_address(params[:sender])
    receiver = Address.find_by_address(params[:receiver])
    Transaction.create(
      sender: sender,
      receiver: receiver,
      amount: params[:amount]
    )

    render text: :ok
  end

  def index
    @transactions = Transaction.all
  end
end
