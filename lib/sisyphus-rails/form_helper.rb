module ActionView
  module Helpers
    module FormHelper
      def form_for_with_sisyphus(record, options = {}, &proc)

        case record
        when String, Symbol
          object_name = record
        else
          object      = record.is_a?(Array) ? record.last : record
          object_name = options[:as] || ActiveModel::Naming.param_key(object)
        end


        # There is an order of precedence debugger
        Sisyphus::process = true

        Sisyphus::process = Sisyphus::config["SISYPHUS_ENABLED"] if Sisyphus::config.include?("SISYPHUS_ENABLED")

        if Sisyphus::config["EXCLUDE_MODELS"].present?
           Sisyphus::process = false if Sisyphus::config["EXCLUDE_MODELS"].include?(model_name_from_record_or_class(object_name))
        end

        Sisyphus::process = options[:with_sisyphus] if options.include?(:with_sisyphus)

        #strip all the sisyphus options from the options hash before moving on
        form_for_without_sisyphus(record, options.reject{|k,v| k =~ /sisyphus(.*)/}, &proc)
      end

      alias_method_chain :form_for, :sisyphus
    end
  end
end