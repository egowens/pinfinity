class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @pins = current_user.pins
      @feed_items = current_user.pin_feed
    end
  end

  def help
  end

  def about
  end
end
