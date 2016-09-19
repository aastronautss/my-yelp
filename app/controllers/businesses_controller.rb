class BusinessesController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def index
    @businesses = Business.paginate page: params[:page]
  end

  def show
    @business = Business.find params[:id]
    @review = Review.new
    @reviews = @business.reviews.paginate page: params[:page]
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new business_params

    if @business.save
      flash[:success] = 'You have successfully added a business!'
      redirect_to business_path(@business)
    else
      render :new
    end
  end

  private

  def business_params
    params.require(:business).permit :name, :address, :city, :state, :zip, :phone, :website_url, :description, :summary
  end
end
