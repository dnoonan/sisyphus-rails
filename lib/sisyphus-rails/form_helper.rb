module ActionView
  module Helpers
    module FormHelper
      def form_for_with_sisyphus(record, options = {}, &proc)
           
        if options[:with_sisyphus] == false 
          Sisyphus::process = false
        else
          Sisyphus::process = true
        end

        #strip all the sisyphus options from the options hash before moving on
        form_for_without_sisyphus(record, options.reject{|k,v| k =~ /sisyphus(.*)/}, &proc)
      end

      alias_method_chain :form_for, :sisyphus
    end
  end
end