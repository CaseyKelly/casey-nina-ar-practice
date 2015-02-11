class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def new
    @location = Location.new
    @company = Company.find(params[:company_id])
  end

  def show
  end

  def index
    @company = Company.find(params[:company_id])
    @locations = @company.locations
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    @company = Company.find(params[:company_id])
    @location.company_id = params[:company_id]
    if @location.save
      redirect_to company_path(@company)
    else
      render :new
    end
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
