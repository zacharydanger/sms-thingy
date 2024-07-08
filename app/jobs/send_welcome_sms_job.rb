class SendWelcomeSmsJob < ApplicationJob
  queue_as :default

  def perform(phone_number:)
    # Do something later
    client.messages.create(
      body: "Hey there, it's #{Time.now}. Seems like a clock would've been easier.",
      to: phone_number,
      from: ENV.fetch("TWILIO_PHONE_NO")
    )
  end

  private

  def client
    @client ||= Twilio::REST::Client.new ENV.fetch("TWILIO_SID"), ENV.fetch("TWILIO_TOKEN")
  end
end
