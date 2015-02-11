class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

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

  end

  def edit

  end

  def update
    @company.update(company_params)
    redirect_to company_path(@company)
  end

  def destroy
    if @company.destroy
      redirect_to companies_path
    end
  end

    private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :suffix, :catch_phrase, :email, :start_date, :industry)
    end
end
