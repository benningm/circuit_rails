[![Gem Version](https://badge.fury.io/rb/circuit_rails.svg)](https://badge.fury.io/rb/circuit_rails)

# circuit\_rails

*circuit_rails* is an Action Mailer adapter for sending messages to Circuit from Rails apps.
It uses the [Circuit REST API](https://circuitsandbox.net/rest/v2/swagger/ui/index.html) thru the [circuit\_client](https://github.com/benningm/circuit_client) gem.

## Installing

In your `Gemfile`

```ruby
gem 'circuit_rails'
```

## Usage

In your environment configuration (development.rb, production.rb, ...) configure circuit settings:

```ruby
config.action_mailer.circuit_settings = {
  client_id: '<your client_id>',
  client_secret: '<your client_secret>',
}
```

If you want to set it as default delivery\_method:

```ruby
config.action_mailer.delivery_method = :circuit
```

Or create a base class for circuit mailers:

```ruby
# apps/mailers/circuit_mailer.rb
class CircuitMailer < ApplicationMailer
  default default_conversation: '<your default conversation>'

  def mail(headers = {}, &block)
    headers[:delivery_method] = :circuit
    super
  end
end
```

Then use this class in your mailers:

```ruby
# apps/mailers/hello_world_mailer.rb
class HelloWorldMailer < CircuitMailer
  def hello_world
    mail(subject: 'Hello World!')
  end
end
```

