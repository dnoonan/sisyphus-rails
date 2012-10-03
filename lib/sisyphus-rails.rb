require "sisyphus-rails/version"
require "sisyphus-rails/engine"
require "sisyphus-rails/form_helper"
require "sisyphus-rails/form_tag_helper"

module Sisyphus
  mattr_accessor :process
  mattr_accessor :app_root
  mattr_accessor :config
  
  def self.setup
    yield self
  end
end