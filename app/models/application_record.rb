# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def presented
    "#{self.class}Presenter".constantize.new(self)
  end
end
