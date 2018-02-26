require 'circuit_client'

module CircuitRails
  class DeliveryMethod
    class MissingParameter < StandardError ; end

    attr_accessor :settings

    DEFAULTS = {
      :host => 'eu.yourcircuit.com',
      :client_id => nil,
      :client_secret => nil,
      :default_conversation => nil,
    }

    def initialize(values)
     self.settings = DEFAULTS.merge(values)
    end

    def client
      @client ||= CircuitClient::Client.new do |c|
        c.host = settings[:host]
        c.client_id = settings[:client_id]
        c.client_secret = settings[:client_secret]
      end
    end

    def deliver!(mail)
      conv = mail.conversation || settings[:default_conversation]
      raise MissingParameter, "a conversation or default_conversation is required for circuit delivery!" if conv.nil?
      body = mail.multipart? ? mail.text_part.body.decoded : mail.body.decoded
      options = {}
      options[:subject] = mail.subject unless mail.subject.nil?
      client.create_message(conv, body, **options)
    end
  end
end

