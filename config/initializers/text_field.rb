#require 'action_view/helpers/tags/placeholderable'
#
#module ActionView
#  module Helpers
#    module Tags # :nodoc:
#      class TextField < Base # :nodoc:
#        include Placeholderable
#        def render
#          options = @options.stringify_keys
#          options["size"] = options["maxlength"] unless options.key?("size")
#          options["type"] ||= field_type
#          options["value"] = options.fetch("value") { value_before_type_cast(object) } unless field_type == "file"
#          add_default_name_and_id(options)
#          puts 'ddd'
#          tag("input", options)
#        end
#      end
#    end
#  end
#end


ActionView::Helpers::Tags::TextField.class_eval do
  def render
    options = @options.stringify_keys
    options["size"] = options["maxlength"] unless options.key?("size")
    options["type"] ||= field_type
    options["value"] = options.fetch("value") { value_before_type_cast(object) } unless field_type == "file"
    add_default_name_and_id(options)
    if self.object.errors.messages[@method_name.to_sym].blank?
      tag("input", options)
    else
      length = self.object.errors.messages[@method_name.to_sym].length
      errors = ''
      self.object.errors.messages[@method_name.to_sym].each_with_index do |e, i|
        if i == (length-1)
          errors += e.to_s + '.'
        else
          errors += e.to_s + ', '
        end
      end
      tag("input", options) + "<div class='form_error bg-danger small'> #{errors} </div>".html_safe
    end
  end
end

