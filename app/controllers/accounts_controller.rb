class AccountsController < ApplicationController
  protect_from_forgery except: :create
  before_action :authorize, only: :create

  def authorize
    if params[:key] != ENV['SECRET_KEY']
      head status: :unauthorized
    end
  end
  def create
    @account = Account.new(account_params)
    @account.save
    Transaction.new(receiver: @account, amount: 10).save(validate: false)
    render json: @account
  end

  def show
    @account = Account.find_by_address(params[:id])

    render json: @account, root: :account,serializer: AccountWithTransactionsSerializer
  end

  def account_params
    params.require(:account).permit(:address, :public_key)
  end
end
