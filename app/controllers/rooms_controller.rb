class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)
  end


  private

  def room_params
    params.require(:room).permit(user_ids: [])
  end
end
