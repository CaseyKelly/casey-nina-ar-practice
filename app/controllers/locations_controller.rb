class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def new
    @location = Location.new
  end

  def show
  end

  def index
    @locations = Company.locations
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    @company = Company.find(params[:company_id])
    redirect_to company_path(@company)
  end

  def destroy
    @location.destroy
    @company = Company.find(params[:company_id])
    redirect_to company_path(@company)
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:city, :street_name, :state, :zip_code, :country)
  end

end
