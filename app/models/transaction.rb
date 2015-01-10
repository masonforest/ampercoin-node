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
      sender_id: sender.id.to_s,
      receiver_id: receiver.id.to_s,
      amount: '%.8f' % amount
    }.to_json
  end
end
