class StaticPagesController < ApplicationController
  def home
    @pin = current_user.pins.build if user_signed_in?
  end

  def help
  end

  def about
  end
end
