module Formal

  # Public: Adds functionality to rails form builder
  #
  class FormBuilder < ActionView::Helpers::FormBuilder

    # Public: renders html label element
    #
    # method  - String or Symbol object attribute
    # text    - String text to be rendered inside of `label` markup
    #           (optional, default: nil)
    # options - Hash of options
    #           :error_element - String or Symbol representing html element the
    #                            error markup will be rendered in.
    #                            (optional, default: :span)
    #           :hide_errors   - Boolean to hide error markup if it is to be
    #                            rendered. (optional)
    def label(method, text = nil, options = {}, &block)
      error_element = options.delete(:error_element) || :span
      hide_errors   = options.delete(:hide_errors)
      i18n_text     = I18n.t("#{object_name}.#{method}", default: '', scope: "helpers.label").presence
      text          = i18n_text || text || method.to_s.humanize

      unless object.nil? || hide_errors
        errors = object.errors[method.to_sym]
        if errors.present?
          error_message = errors.is_a?(Array) ? errors.first : errors
          error_markup = @template.content_tag(error_element, error_message, class: 'error')
          text << " #{error_markup}"
        end
      end

      super(method, text.html_safe, options, &block)
    end

    def check_box_with_label(method, text = nil, *args)
      text = text || method.to_s
      box = [check_box(method, *args).html_safe, text].join(" ")
      label(method, box, *args)
    end
  end
end
