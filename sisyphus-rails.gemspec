# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sisyphus-rails/version'

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

  gem.requirements << 'requires jQuery 1.4+ to be included before Sisyphus'
  gem.requirements << 'requires jQuery 1.8+ to be included if you require jStorage'

  gem.add_dependency "rails", ">= 3.1.0"
end

