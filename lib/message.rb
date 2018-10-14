require 'twilio-ruby'

class Message
  def initialize(client: Twilio::REST::Client.new(
    ENV["MY_TWILIO_SID"],
    ENV["MY_TWILIO_AUTH_TOKEN"]))

    @client = client
  end

  def send
    @client.messages.create(
      body: "Thank you for your order! It will be delivered before #{time}",
      to: ENV["MY_PHONE_NUMBER"],
      from: ENV["MY_TWILIO_PHONE_NUMBER"]
    )
  end

  def time
    "#{Time.now.hour + 1}:#{Time.now.min}"
  end
end
