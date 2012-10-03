module Sisyphus
  module Generators
    class ConfigurationGenerator < ::Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      desc "Creates blank config file for extended configuration."

      def create_yaml
        template "sisyphus.yml", "config/sisyphus.yml"
      end
    end
  end
end