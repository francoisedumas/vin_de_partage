# frozen_string_literal: true

class MenuLinkComponent < ViewComponent::Base
  attr_reader :title, :icon, :path, :policy

  def initialize(title:, icon:, path:, policy: true)
    @title = title
    @icon = icon
    @path = path
    @policy = policy
  end

  def render?
    policy
  end

  def active?
    path == helpers.active_menu_link
  end

  def active_classes
    active? ? "bg-gray-500" : "hover:bg-gray-600 hover:bg-opacity-75"
  end
end
