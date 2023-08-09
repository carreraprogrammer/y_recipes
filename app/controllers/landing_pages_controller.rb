# frozen_string_literal: true

class LandingPagesController < ApplicationController
  def home
    return unless user_signed_in?

    redirect_to recipes_path
  end
end
