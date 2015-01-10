class AccountWithTransactionsSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :address, :public_key, :balance

  has_many :transactions
  # def transactions
  #   object.transactions.map do |transaction|
  #     TransactionSerializer.new(transaction)
  #   end
  # end


end
