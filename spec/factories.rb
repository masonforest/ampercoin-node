FactoryGirl.define do
  factory :account do
    sequence :address do |n|
      "user#{n}"
    end

    public_key { Ampercoin::Address.new.public_key }
  end

  factory :transaction do
    association :sender, factory: :account
    association :receiver, factory: :account
  end
end
