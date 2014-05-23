class PinsController < ApplicationController

  def index
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      flash[:success] = "Equation pinned!"
      redirect_to root_url
    else
      @pin_items = current_user.pin_feed
      render 'static_pages/home'
    end
  end

  def edit
  end

  def destroy
    @pin.destroy
    redirect_to root_url
  end

  private

    def pin_params
      params.require(:pin).permit(:equation, :description)
    end

end
