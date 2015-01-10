class AccountSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :address, :public_key, :balance

end
