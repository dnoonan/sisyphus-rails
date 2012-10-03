module ActionView
  module Helpers
    module FormTagHelper

      def form_tag_with_sisyphus(url_for_options = {}, options = {}, &block)
        buf = ActiveSupport::SafeBuffer.new

        if options.has_key?(:id) && Sisyphus::process
          buf.safe_concat("<script type=\"text/javascript\">$(document).ready(function() {$('##{options[:id]}').sisyphus({excludeFields: $('input[name=utf8], input[name=_method], input[name=authenticity_token]')});});</script>")
        end

        buf << form_tag_without_sisyphus(url_for_options, options, &block)
      end

      alias_method_chain :form_tag, :sisyphus
    end
  end
end
