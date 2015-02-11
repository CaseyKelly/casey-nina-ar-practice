class ProductsController < ApplicationController

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

    def show
      @product = Product.find(params[:id])
      @company =Company.find(params[:id])
      @product = @company.product
    end

    def edit
      @product = Product.find(params[:id])
    end


    end
