module Sisyphus
  class FormBuilder < ActionView::Helpers::FormBuilder
    def initialize(object_name, object, template, options, block=nil)
      super
      @template.output_buffer << "<script type=\"text/javascript\">$(document).ready(function() {$('##{self.options[:html][:id]}').sisyphus();});</script>".html_safe
    end
  end
end
