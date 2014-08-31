class Address < ActiveRecord::Base
  has_many :credits, foreign_key: :sender_id, class_name: 'Transaction'

  def balance
    credits.sum(:amount)
  end
end
