module JSONHelpers
  def json_response
    JSON.parse(response.body)
  end
end

RSpec.configure do |c|
  c.include JSONHelpers
end
