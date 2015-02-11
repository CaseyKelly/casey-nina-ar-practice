class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
      @products = Company.products
    end

    def new
      @product = Product.new
      @company = Company.find(params[:company_id])
    end

    def create
      @product = Product.new(product_params)
      @company = Company.find(params[:company_id])
      @product.company_id = params[:company_id]
      if @product.save
        redirect_to company_path(@company)
      else
        render :new
      end
    end

    def update
      @product.update(product_params)
      @company = @product.company
      redirect_to company_path(@company)
    end

    def destroy
      @product.destroy
      @company = Company.find(params[:company_id])
      redirect_to company_path(@company)
    end

    def show
      @company = Company.find(params[:company_id])
      @product.company_id = params[:company_id]
      @review.product_id = params[:product_id]
    end

    def edit
      @company = Company.find(params[:company_id])

    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :department, :price)
    end

end
