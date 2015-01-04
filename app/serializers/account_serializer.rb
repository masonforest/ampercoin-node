class AccountSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :address, :public_key, :balance

  has_many :transactions, include: true, embed: :ids
end
