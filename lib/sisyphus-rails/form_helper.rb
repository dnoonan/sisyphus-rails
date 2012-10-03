module ActionView
  module Helpers
    module FormHelper
      def form_for_with_sisyphus(record, options = {}, &proc)
        
        # There is an order of precedence debugger
        Sisyphus::process = true

        Sisyphus::process = Sisyphus::config["SISYPHUS_ENABLED"] if Sisyphus::config["SISYPHUS_ENABLED"].present?

        # if Sisyphus::config["EXCLUDE_MODELS"].present?
        #   Sisyphus::process = false if Sisyphus::config["EXCLUDE_MODELS"].include?(model_name_from_record_or_class(record))
        # end

        if options[:with_sisyphus] == false
          Sisyphus::process = false
        end

        #strip all the sisyphus options from the options hash before moving on
        form_for_without_sisyphus(record, options.reject{|k,v| k =~ /sisyphus(.*)/}, &proc)
      end

      alias_method_chain :form_for, :sisyphus
    end
  end
end