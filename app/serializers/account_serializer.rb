class AccountSerializer < ActiveModel::Serializer
  attributes :address, :public_key, :balance
end
