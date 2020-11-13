class FlatsController < ApplicationController
  before_action :fetch_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query OR price ILIKE :query OR address ILIKE :query"
      @flats = Flat.where(sql_query, query: "%#{params[:query]}%")
      # @flats = Flat.search_by_name_and_address_and_price_and_description(params[:query])
   else
      @flats = Flat.all
   end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    @flat.user.role = 'owner'
    if @flat.save
      flash[:notice] = "You are now the owner of #{@flat.name}"
      redirect_to my_flats_path
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :description, :address, :price)
  end

  def fetch_flat
    @flat = Flat.find(params[:id])
  end
end
