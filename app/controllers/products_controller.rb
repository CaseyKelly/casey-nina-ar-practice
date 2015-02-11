class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(params[:id])
      if @product.save
        redirect_to company_path(@company)
      else
        render :new
      end
    end

    def update
      @product.update(product_params)
      redirect_to company_path(@company)
    end

    def destroy
      @product.destroy
      @company = Company.find(params[:company_id])
      redirect_to company_path(@company)
    end

    def show
      @company =Company.find(params[:company_id])
      @product = @company.product
    end

    def edit
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :department, :price)
    end

end
