# Icing

Icing is a framework to reify and work with composable decorations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'icing'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install icing

## Usage

Here is a simple example:

```ruby
class WithPrefix < Icing::Decorations::Base

  def decorated(object, method_name, *args, &block)
    "Ruby says: #{super}"
  end

end

class WithExclam < Icing::Decorations::Base

  def decorated(object, method_name, *args, &block)
    super + '!'
  end

end

class Greeter

  def say_hello(name)
    "Hello, #{name}"
  end

  def say_welcome(name)
    "Welcome, #{name}"
  end

end

decorated_greeter = Icing.decorator(Greeter.new, {
  say_hello: [WithExclam.new, WithPrefix.new],
  say_welcome: WithExclam.new
})

decorated_greeter.say_hello("Foo")   # "Ruby says: Hello, Foo!"
decorated_greeter.say_welcome("Bar") # "Welcome, Bar!"
```

More examples can be found in the test files.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eugeniobruno/icing. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

