# frozen_string_literal: true

module RoundedImageHelper
  def rounded_image(target_image, size = 40, classes = nil)
    if target_image.attached?
      image_tag(target_image.url,
                height: size,
                width: size,
                class: "inline-block rounded-full #{classes}",
                alt: "profile")
    else
      image_tag("kitten.jpg",
                alt: "Default project image",
                height: size,
                width: size,
                class: "inline-block rounded-full #{classes}")
    end
  end
end
