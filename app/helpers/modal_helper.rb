# frozen_string_literal: true

##
# modal template is in head
module ModalHelper
  BASE_DATASET = {
    controller: "modal",
    action: "click->modal#open"
  }.freeze

  ##
  # Works with modal_controller.js
  # Usage:
  #   = button_tag "Hello", data: modal_with(render("form", order: @order))
  # You can specify refresh: true if you want the content of the modal
  # to be re-initialized when it is closed and opened again
  def modal_with(content, refresh: false, no_background: false)
    BASE_DATASET.merge(
      modal_content_value: content,
      modal_refresh_value:
      refresh, modal_no_background_value: no_background
    )
  end

  ##
  # Builds the data attributes to trigger a modal that will
  # lazily loads its content with turbo_frame.
  # You just have to provide the id you would give to the turbo_frame_tag
  # and path for the turbo_frame_tag's source
  # As for modal_with, you can path refresh: true if you want to load
  # again the frame each time the modal is opened
  # see {Lazy-loaded frame}[https://turbo.hotwired.dev/reference/frames#lazy-loaded-frame] for more details
  # Usage:
  #   = button_tag "Hello", data: remote_modal_to("hello", "/hello", refresh: true)
  def remote_modal_to(id, path, refresh: false, no_background: false)
    BASE_DATASET.merge(
      modal_refresh_value: refresh,
      modal_remote_id_value: id,
      modal_remote_path_value: path,
      modal_no_background_value: no_background
    )
  end

  ##
  # Builds a default styled button to close the modal (thanks to the data-modal="close" attribute).
  # A block can be given, as for the regular button_tag helper
  def modal_cancel_button(text = t("cancel"), **options, &block) # rubocop:disable Naming/BlockForwarding
    options.assert_valid_keys(:class)

    classes = "btn btn-secondary #{options[:class]}"

    button_tag(text, data: { modal: "close" }, type: "button", class: classes, &block) # rubocop:disable Naming/BlockForwarding
  end
end
