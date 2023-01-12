# frozen_string_literal: true

class ShowcaseSiteController < ApplicationController
  layout "website"

  skip_before_action :authenticate_user!

  def landing
  end
end
