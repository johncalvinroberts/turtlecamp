class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create ]

  def create
    @booking = Booking.create(booking_params)
  end

private

  def booking_params
    booking_params = params.require(:booking).permit(:name, :email, :phone)
  end
end
