# frozen_string_literal: true

LABEL_CLASSES = "block text-sm font-medium text-gray-700 mb1"
INPUT_CLASSES = %w[
  shadow-sm focus:ring-primary-500 focus:border-primary-500 block w-full sm:text-sm border-gray-300 rounded-md
].join(" ").freeze

BUTTON_CLASSES = %w[
  inline-flex items-center px-4 py-2 border border-transparent
  text-sm font-medium text-white
  rounded-md shadow-sm bg-primary-600 hover:bg-primary-700
  focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500
  cursor-pointer
].join(" ").freeze

SimpleForm.setup do |config|
  config.wrappers :default, class: "h-20" do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: LABEL_CLASSES, error_class: "text-red-900"
    b.use :input, class: INPUT_CLASSES,
                  error_class: "border-red-300 text-red-900 placeholder-red-300 focus:ring-red-500 focus:border-red-500"
    b.use :error, wrap_with: { tag: :p, class: "mt-2 text-sm text-red-600" }
  end

  config.wrappers :boolean, class: "flex items-center" do |b|
    b.use :html5
    b.use :input, class: "h-4 w-4 text-primary-600 focus:ring-primary-500 border-gray-300 rounded",
                  error_class: "TODO", valid_class: "TODO"
    b.use :label, class: "ml-2 block text-sm text-gray-900"
  end

  config.default_wrapper = :default
  config.wrapper_mappings = {
    boolean: :boolean
  }

  # Default configuration
  config.generate_additional_classes_for = []
  config.default_form_class = "space-y-6"
  config.button_class = BUTTON_CLASSES
  config.label_text = -> (label, _required, _explicit_label) { label }

  config.error_notification_tag = :div
  config.error_notification_class = "error_notification"
  config.error_method = :to_sentence

  config.browser_validations = false
  config.boolean_style = :inline
end
