class AccountsController < ApplicationController
  def show
    @account = Account.find_by_address(params[:id])

    render json: @account
  end
end
