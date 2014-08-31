class AddressesController < ApplicationController
  def show
    @address = Address.find_by_address(params[:id])

    render json: {
      balance: @address.balance
    }
  end
end
