class ReviewsController < ApplicationController

  def index
    @reviews = Review.reservation 
    render :index
  end


  def new
    @review = Review.new
    render :new
  end

  def create
    @review = Review.create(review_params)
    if @review.valid?
      redirect_to reviews_path
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :flight_id, :rating, :content)
  end

end
