class TransactionSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :amount, :created_at
  has_one :sender, include: true, embed: :ids, root: :accounts
  has_one :receiver, include: true, embed: :ids, root: :accounts
end
