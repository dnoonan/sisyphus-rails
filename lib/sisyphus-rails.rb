require "sisyphus-rails/version"
require "sisyphus-rails/engine"
require "sisyphus-rails/form_helper"

module Sisyphus

end

if defined?(ActionView::Base)
  ActionView::Base.default_form_builder = Sisyphus::FormBuilder
end