class RoomsController < ApplicationController
  before_action :set_room, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    if params[:query]
      @query = params[:query]
      sql_query = "name ILIKE :query OR address ILIKE :query"
      @hotels = Hotel.where(sql_query, query: "%#{params[:query]}%")
      @rooms = Room.where(hotel_id: @hotels)
    else
      @rooms = Room.all
    end
  end

  def show
    @hotel = Hotel.where(id: @room.hotel_id)
    @booking = Booking.new
    @markers = @hotel.geocoded.map do |room|
      {
        lat: room.latitude,
        lng: room.longitude
      }
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end
end
