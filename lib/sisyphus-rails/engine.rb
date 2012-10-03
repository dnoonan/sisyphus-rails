module Sisyphus
  class Engine < ::Rails::Engine

    initializer "sisyphus-rails.load_config_data" do |app|
      Sisyphus.setup do |config|
        config.app_root = app.root
    
        #Load the configuration from the environment or a yaml file
        Sisyphus.config = Hash.new

        #load the config file if we have it
        if FileTest.exist?("#{::Rails.root}/config/sisyphus.yml")
          config = YAML.load_file("#{::Rails.root}/config/sisyphus.yml")
          config = config[::Rails.env]

          Sisyphus.config["SISYPHUS_ENABLED"] = config['sisyphus_enabled'] if config.include?('sisyphus_enabled')
          Sisyphus.config["EXCLUDE_MODELS"] = config['exclude_models'].split(',') if config.include?('exclude_models')
          Sisyphus.config["INCLUDE_MODELS"] = config['include_models'].split(',') if config.include?('include_models')
          
        end

        #if we have ENV flags prefer them
        Sisyphus.config["SISYPHUS_ENABLED"] = ENV["SISYPHUS_ENABLED"] if ENV.include?("SISYPHUS_ENABLED")
        Sisyphus.config["EXCLUDE_MODELS"] = ENV["EXCLUDE_MODELS"].split(',') if ENV.include?("EXCLUDE_MODELS")
        Sisyphus.config["INCLUDE_MODELS"] = ENV["INCLUDE_MODELS"].split(',') if ENV.include?("INCLUDE_MODELS")

      end
    end

  end
end