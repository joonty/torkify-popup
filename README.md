# Torkify-popup

Torkify aims to be a one-stop shop for testing ruby applications, and handling callbacks after test execution for things like notifications.

Torkify-popup adds system popups to torkify, so that you get bubble notifications when tests pass or fail.

It uses the [notifier][1] gem to allow compatibility with Linux's `notify_send`, OSX's `growl` and more.

## Installation

Add this line to your application's Gemfile:

    gem 'torkify-popup'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install torkify-popup

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[1]: http://rubygems.org/gems/notifier
