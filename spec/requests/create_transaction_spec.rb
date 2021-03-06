require 'spec_helper'

describe 'creating a transaction', type: :request do
  it 'updates the users balance' do
    sender_address = Ampercoin::Address.new
    sender = create(
      :account,
      public_key: sender_address.public_key
    )
    build(:transaction, receiver: sender, amount: 10).save(validate: false)
    receiver = create(:account)

    transaction = {
      sender_id: sender.id.to_s,
      receiver_id: receiver.id.to_s,
      amount: '%.8f' % 10
    }

    signature = sender_address.sign(transaction.to_json)

    post '/transactions', transaction: transaction.merge(signature: signature)

    expect(response.status).to be 200

    get "/accounts/#{receiver.address}"

    expect(JSON.parse(response.body)['account']['balance']).to eq "10.0"
  end

  it "responds with an error if the transaction has an invalid signature" do
    sender = create(:account)
    receiver = create(:account)
    build(:transaction, receiver: sender, amount: 10).save(validate: false)

    post '/transactions', transaction: {
      receiver_id: receiver.id,
      sender_id: sender.id,
      amount: 10,
      signature: 'invalid_signature'
    }


    expect(response.status).to be 422
    expect(response.body).to eq '{"errors":{"signature":["is an invalid signature"]}}'
  end
end
