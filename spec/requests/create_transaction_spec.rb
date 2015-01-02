require 'spec_helper'

describe 'creating a transaction', type: :request do
  it 'updates the users balance' do
    sender_address = Ampercoin::Address.new
    sender = create(
      :account,
      public_key: sender_address.public_key
    )
    receiver = create(:account)

    transaction = {
      sender: sender.address,
      receiver: receiver.address,
      amount: 10
    }

    signature = sender_address.sign(transaction.to_json)

    post '/transactions', transaction.merge(signature: signature)

    expect(response.status).to be 200

    get "/accounts/#{receiver.address}"

    expect(JSON.parse(response.body)['account']['balance']).to eq 10
  end

  it "responds with an error if the transaction has an invalid signature" do
    sender = create(:account)
    receiver = create(:account)

    post '/transactions', {
      receiver: receiver.address,
      sender: sender.address,
      amount: 10,
      signature: 'invalid_signature'
    }


    expect(response.status).to be 422
    expect(response.body).to eq '{"errors":{"signature":["is an invalid signature"]}}'
  end
end
