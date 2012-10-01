# Sisyphus::Rails

A gem to add gmail like form saving through sisyphus.js

## Installation

Add this line to your application's Gemfile:

    gem 'sisyphus-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sisyphus-rails

For a basic install include the following in your ++app/assets/javascripts/application.js++ file

    //= require jstorage
    //= require sisyphus

## Usage

If you are using the default form builder you do not have to modify anything to have Sisyphus start auto-saving your forms. 

ActionView::Base.default_form_builder = YourFormBuilder

## Dependencies

- Rails >= 3.1
- Jquery

## TODO

- Tests
- Multiple library support for jStorage (Prototype, Mootools etc.)
- Support for formtastic and extending other form builders
- Model/Object based exclusions

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Dependencies

https://github.com/simsalabim/sisyphus
https://github.com/andris9/jStorage