require 'rails_helper'

describe Transaction, type: :model do
  it "amount must be greater than 0" do
    transaction = build(:transaction, amount: 0)
    transaction.save

    expect(transaction.errors).to include(:amount)
  end
end
