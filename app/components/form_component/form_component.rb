# frozen_string_literal: true

module FormComponent
  class FormComponent < ViewComponent::Base
    renders_many :actions
  end
end
