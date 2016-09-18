class BusinessesController < ApplicationController
  def index
    @businesses = Business.paginate page: params[:page]
  end
end
