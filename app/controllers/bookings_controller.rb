class BookingsController < ApplicationController
  before_action :set_flat, only: %i[create]
  before_action :set_booking, only: %i[destroy]

  def create

    @booking = Booking.new(booking_params)
    @booking.room = @room
    @booking.total_price = (@booking.ends_at - @booking.starts_at).to_i * @room.price_per_night
    @booking.user = current_user
    if @booking.save!
      redirect_to room_path(@room), info: "Room booked successfully! You can find all the details in your #{view_context.link_to 'dashboard', dashboard_bookings_path}"
    else
      render 'rooms/show', status: :unprocessable_entity
    end
  end

  def dashboard
    @my_bookings = Booking.where(user: current_user)
  end

  def destroy
    @booking.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_flat
    @room = Room.find(params[:room_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end
end
