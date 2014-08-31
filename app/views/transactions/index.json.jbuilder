json.array!(@transactions) do |transaction|
  json.sender transaction.sender.address
  json.receiver transaction.receiver.address
  json.amount transaction.amount
end
