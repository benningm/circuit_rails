module CircuitRails
  class Railtie < Rails::Railtie
    initializer "circuit_rails.add_delivery_method" do
      ActiveSupport.on_load :action_mailer do
        ActionMailer::Base.add_delivery_method :circuit, CircuitRails::DeliveryMethod
      end
    end
  end
end
