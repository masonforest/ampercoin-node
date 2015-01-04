module TransactionHelpers
  def create_transaction(sender: nil, receiver: nil, amount: 0)
    sender ||= create(:account)
    receiver ||= create(:account)
    transaction = build(
      :transaction,
      sender: sender,
      receiver: receiver,
      amount: amount
    )

    transaction.save(validate: false)
    transaction
  end
end

RSpec.configure do |c|
  c.include TransactionHelpers
end
