require 'spec_helper'

describe 'creating a transaction', type: :request do
  it 'GET /accounts/user' do
    user = create(:account)
    create_transaction(receiver: user, amount: 10)

    get "/accounts/#{user.address}"

    expect(json_response['account']['balance']).to eq 10
    expect(json_response['credits']).to be_present
  end
end
