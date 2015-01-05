class Account < ActiveRecord::Base
  has_many :credits, class_name: 'Transaction', foreign_key: :receiver_id
  has_many :debits, class_name: 'Transaction', foreign_key: :sender_id

  def balance
    total_credits - total_debits
  end

  def verify_signature(message, signature)
    key.verify(message, signature)
  end

  def transactions
    (credits + debits).sort{|a, b| b.created_at <=> a.created_at }
  end

  private

  def total_debits
    debits.total
  end

  def total_credits
    credits.total
  end

  def key
    @key ||= Ampercoin::Address.new(public_key: public_key)
  end
end
