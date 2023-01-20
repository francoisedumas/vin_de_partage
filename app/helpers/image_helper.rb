# frozen_string_literal: true

module ImageHelper
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

  def regular_image(target_image, size = 40, classes = nil)
    if target_image.attached?
      image_tag(target_image.url,
                height: size,
                width: size,
                class: "inline-block h-auto #{classes}",
                alt: "profile")
    else
      image_tag("kitten.jpg",
                alt: "Default project image",
                height: size,
                width: size,
                class: "inline-block h-auto #{classes}")
    end
  end
end
