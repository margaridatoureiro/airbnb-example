class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def my_flats
    if params[:query].present?
      @flats = Flat.where(user: current_user).search_by_name_and_address_and_price_and_description(params[:query])
    else
      @flats = Flat.where(user: current_user)
    end
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end
end
