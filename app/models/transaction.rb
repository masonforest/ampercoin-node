class Transaction < ActiveRecord::Base
  belongs_to :sender, class_name: 'Address'
  belongs_to :receiver, class_name: 'Address'
  accepts_nested_attributes_for :sender
  accepts_nested_attributes_for :receiver
end
