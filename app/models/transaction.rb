class Transaction < ActiveRecord::Base
  belongs_to :sender, class_name: 'Account'
  belongs_to :receiver, class_name: 'Account'
  belongs_to :block

  accepts_nested_attributes_for :sender
  accepts_nested_attributes_for :receiver
  validates :signature, signature: {verify: :contract}

  def self.total
    sum(:amount)
  end

  def contract
    {
      sender: sender.address,
      receiver: receiver.address,
      amount: amount
    }.to_json
  end
end
