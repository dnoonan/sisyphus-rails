# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sisyphus/rails/version'

Gem::Specification.new do |gem|
  gem.name          = "sisyphus-rails"
  gem.version       = Sisyphus::Rails::VERSION
  gem.authors       = ["Devon Noonan"]
  gem.email         = ["devon.noonan@gmail.com"]
  gem.description   = %q{Include gmail like auto-save on your forms}
  gem.summary       = %q{Using Sisyphus.js and jStorage.js the gem overrides the default rails form builder to add an auto-save feature to your forms.}
  gem.homepage      = "https://www.github.com/dnoonan/sisyphus-rails"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "railties", "~> 3.1"
  gem.add_dependency "jquery-rails"
end
