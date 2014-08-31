require 'spec_helper'

describe 'ampercoin', type: :request do
  it 'creates a transaction' do
    receiver = Ampercoin::Key.new
    sender = Ampercoin::Key.new

    credit(sender.address, 100)

    post '/transactions', {
      receiver: receiver.address,
      sender: sender.address,
      amount: 10,
      signature: 'xxx'
    }

    expect(response.status).to be 200

    get "/addresses/#{receiver.address}"
    expect(JSON.parse(response.body)['balance']).to eq 10
  end
end

def credit(address, amount)
  Transaction.create(
    receiver_attributes: {
      address: address
    },
    amount: amount
  )
end
