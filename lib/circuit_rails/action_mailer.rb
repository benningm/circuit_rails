require 'action_mailer'

ActionMailer::Base.add_delivery_method :circuit, CircuitRails::DeliveryMethod
