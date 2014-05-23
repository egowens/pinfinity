class PinsController < ApplicationController
  before_action :correct_user, only: :destroy

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

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to root_url if @pin.nil?
    end

end
