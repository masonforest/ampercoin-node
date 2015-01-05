class TransactionSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :amount, :created_at
  belongs_to :sender, include: true, embed: :ids
  belongs_to :receiver, include: true, embed: :ids
end
