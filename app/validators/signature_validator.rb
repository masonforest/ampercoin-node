class SignatureValidator < ActiveModel::EachValidator
  def initialize(options)
    @verify =  options[:verify]

    super
  end

  def validate_each(record, attribute, value)
    unless record.sender.verify_signature(record.send(@verify), value)
      record.errors[attribute] << (options[:message] || "is an invalid signature")
    end
  end
end
