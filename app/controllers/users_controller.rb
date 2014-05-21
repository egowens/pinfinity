class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @pins = @user.pins
  end
end
