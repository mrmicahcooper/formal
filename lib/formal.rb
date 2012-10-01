require "formal/version"

module Formal
  class Builder < ActionView::Helpers::FormBuilder

    ActionView::Base.field_error_proc = proc { |input, instance| input }

    @@field_helper_methods = %w(label_tag text_field password_field text_area select email_field search_field telephone_field number_field file_field range_field)

    def label(method, text = nil, options = {}, &block)
      text = text || method.to_s.humanize

      if object.errors.any?
        error_message = object.errors[method]
        errors = error_message.is_a?(Array) ? error_message.first : error_message
        error_span = @template.content_tag(:span, errors, class: 'error')
        text << " #{error_span}"
        @template.content_tag(:dt, super(method, text.html_safe, options, &block), class: 'error')
      else
        @template.content_tag(:dt, super(method, text.html_safe, options, &block))
      end
    end

    @@field_helper_methods.each do |method_name|
      define_method method_name do |*args|
        if object.errors.any?
          @template.content_tag(:dd, super(*args), class: 'error')
        else
          @template.content_tag(:dd, super(*args))
        end
      end
    end

    def check_box_with_label(method, text = nil, *args)
      text = text || method.to_s
      box = [check_box(method, *args).html_safe, text].join(" ")
      label(method, box, *args)
    end

  end
end
