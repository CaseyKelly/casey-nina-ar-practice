class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to companies_path
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])
    if @company.destroy
      redirect_to companies_path
    end
  end

    private
    def company_params
      params.require(:company).permit(:name, :suffix, :catch_phrase, :email, :start_date, :industry)
    end
end
