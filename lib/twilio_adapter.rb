require 'twilio-ruby'

class TwilioAdapter

  attr_reader :client

  def initialize(client)
    @client = client
  end

  def send_sms(body:, to:, from: '+11111111111')
    @client.messages.create(
      from: from,
      to:   to,
      body: body,
    )
  end
  
end