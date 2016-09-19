class ReviewsController < ApplicationController
  before_action :require_user

  def create
    @business = Business.find params[:business_id]
    @review = @business.reviews.build review_params
    @review.user = current_user

    if @review.save
      flash[:success] = "Your review has been successfully submitted."
      redirect_to @business
    else
      render 'businesses/show'
    end
  end

  private

  def review_params
    params.require(:review).permit :rating, :body
  end
end
