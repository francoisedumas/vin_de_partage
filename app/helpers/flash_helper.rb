# frozen_string_literal: true

module FlashHelper
  STATUS_ICON_CLASSES = {
    notice: "fas fa-flag",
    alert: "fas fa-exclamation-triangle",
    success: "fa fa-check-circle"
  }.with_indifferent_access.freeze

  STATUS_FLASH_CLASSES = {
    notice: "text-yellow-700 bg-yellow-100 border-yellow-300",
    alert: "text-red-700 bg-red-100 border-red-300",
    success: "text-green-700 bg-green-100 border-green-300"
  }.with_indifferent_access.freeze

  def flash_alert(flash_type, message)
    classes = +"animate-fade-out flex justify-center items-center m-1 font-medium py-1 px-2 bg-white rounded-md border "
    classes << STATUS_FLASH_CLASSES[flash_type]

    content_tag(:div,
                class: classes,
                data: { controller: "remove", action: "animationend->remove#remove" }) do
      content_tag(:i, nil, class: "#{STATUS_ICON_CLASSES[flash_type]} mr-2") +
        content_tag(:div, message, class: "text-xl font-normal max-w-full flex-initial")
    end
  end
end
