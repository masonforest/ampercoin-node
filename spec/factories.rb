FactoryGirl.define do
  factory :account do
    sequence :address do |n|
      "user#{n}"
    end

    public_key { Ampercoin::Address.new.public_key }
  end

  factory :transaction
end
