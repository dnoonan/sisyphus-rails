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

    //= require sisyphus

To support IE6/7 users include jStorage as well

    //= require jstorage
    //= require sisyphus

### Create a Configuration File

You can use the built in generator to create a basic *sisyphus.yml* configuration file. 

    $ rails generate sisyphus:configuration

The file will be placed in *config/*

## How it Works

Sisyphus uses an aliased form_tag method to automatically put a *&lt;script&gt;...&lt;/script&gt;* tag infront of your forms to initialize Sisyphus. It also uses an aliased FormHelper form_for method to read options.

    <script>$(document).ready(function() {$('#sampleform').sisyphus();});</script>
    <form id="sampleform">
      ...
    </form>

## Usage

Sisyphus automatically works with all your forms, including custom form builders. 

### Exclude a form

To stop Sisyphus from initializing on a form include the *with_sisyphus* option in your form_for.

    <%= form_for User.new, :with_sisyphus=>false do |f| %>
      ...
    <% end %>

### Exclude/Include a model

To exclude or include a specific model you can enter it in your ENV or the *sisyphus.yml* file. The configuration takes a comma (,) separated string of __lower case__ model names.

    exclude_models: user
    include_models: comment,post
    
### Include/Exclude everything

You can also set the *sisyphus_enabled* option to true/false in your ENV or the *sisyphus.yml* file to turn Sisyphus on or off by default.

    sisyphus_enabled: false
    
### Putting the switches together

The switches work together to see if a form should be protected by Sisyphus or not. The *sisyphus_enabled* switch will be used if no other switches are set. If the model is specifically excluded (when *sisyphus_enabled* = true) then it will not be protected. Conversley, if the model is specifically included and *sisyphus_enabled* = false it will be protected. The final say is taken by the form option. If *with_sysphus* is set it's value will be used to determine if the form should be protected or not.

## Dependencies

- Rails >= 3.1
- Jquery 1.8+

## TODO

- Tests

- rubydoc.info hosted documentation so the rubygems.org page doesn't look like crap.
- conflict resolution... i.e. you have an object edit form, the fields are populated from the DB but if you have local browser changes they may get overridden. We need a way to resolve conflicts between local and remote data -> could use a jquery based modal dialog to present the diff?
- Model based exclusions/options via activerecord extension? We have config based exclude/includes now
- implement all sisyphus options and any relevant ones in jStorage
- block based options (this would allow us to easily and neatly implement Sisyphus options). The do...end block is passed in but how do we interact with it to get options out? Is this possible in any way?

    <%= form_for User.new do |f| %>
      <% :sisyphus => flase %>
      <% :sisyphus_customKeyPrefix => 'sisy' %>
      ...
    <% end %>
    
- Move away from form_tag_helper, should be able to do it all from form_helper? Script tag can go at the end anyhow. Why aren't we doing that right now? We don't seem to have access to the same variables that the regular form_for does. Also the options array gets muddied by the FormHelper form_for call -> it removes the [:html] section (we need the id of the form for sisyphus). It would be nice if we could get away with this but there are certain things like the form name that we need to know that aren't easily available in the FormHelper.

## Contributing

If you have time to tackle something off the TODO list before I manage to get around to it then please do!

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Included Libraries

https://github.com/rails/jquery-rails
https://github.com/simsalabim/sisyphus
https://github.com/andris9/jStorage

## Resources

http://coding.smashingmagazine.com/2011/12/05/sisyphus-js-client-side-drafts-and-more/
