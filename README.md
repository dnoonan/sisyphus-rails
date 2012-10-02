# Sisyphus::Rails

A gem to add gmail like form saving through sisyphus.js

## Installation

Add this line to your application's Gemfile:

    gem 'sisyphus-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sisyphus-rails

For a basic install include the following in your *app/assets/javascripts/application.js* file

    //= require jstorage
    //= require sisyphus

## How it Works

Sisyphus uses an aliased form_tag method to automatically put a *&lt;script&gt;...&lt;/script&gt;* tag infront of your forms to initialize Sisyphus. It also uses an aliased FormHelper form_for method to read options.

    <script>$(document).ready(function() {$('#sampleform').sisyphus();});</script>
    <form id="sampleform">
      ...
    </form>
## Usage

Sisyphus automatically works with all your forms, including custom form builders. 

### Exclude form

To stop Sisyphus from initializing on a form include the *with_sisyphus* option in your form_for.

    <%= form_for User.new, :with_sisyphus=>false do |f| %>
      ...
    <% end %>

## Dependencies

- Rails >= 3.1
- Jquery

## TODO

- Tests
- Move away from form_tag_helper, should be able to do it all from form_helper? Script tag can go at the end anyhow.
- Model/Object based exclusions via config or activerecord extension?
- block based options

    <%= form_for User.new do |f| %>
      <% :sisyphus => flase %>
      ...
    <% end %>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Dependencies

https://github.com/simsalabim/sisyphus
https://github.com/andris9/jStorage