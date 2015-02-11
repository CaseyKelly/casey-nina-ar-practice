class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Product.reviews
  end

  def new
    @review = Review.new
    @product = Product.find(params[:product_id])
    @company = Company.find(params[:company_id])
  end

  def show
  end

  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.product_id = params[:product_id]
    if @review.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def update
    @review.update(review_params)
    redirect_to company_path(@company)
  end

  def destroy
    @review.destroy
    @product = Product.find(params[:product_id])
    redirect_to company_path(@company)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end

end
