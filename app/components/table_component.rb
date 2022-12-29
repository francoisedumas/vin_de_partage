# frozen_string_literal: true

class TableComponent < ViewComponent::Base
  attr_reader :model, :columns, :collection

  def initialize(model:, columns:, collection:)
    super
    @model = model
    @columns = columns
    @collection = collection
  end

end
