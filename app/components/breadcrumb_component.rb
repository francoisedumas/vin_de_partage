# frozen_string_literal: true

class BreadcrumbComponent < ViewComponent::Base
  attr_reader :items, :title

  def initialize(items:, title:)
    super
    @items = items
    @title = title
  end

  def back_path
    items.values.last
  end
end
