class CreditSerializer < ActiveModel::Serializer
  attributes :id, :type

  def type
    :credit
  end
end
