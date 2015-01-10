class AccountsController < ApplicationController
  protect_from_forgery except: :create

  def create
    @account = Account.new(account_params)
    @account.save

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
