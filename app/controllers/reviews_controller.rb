class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    render :index
  end


  def new
    @review = Review.new
    @reservations = Reservation.all
    render :new
  end

  def create
    @review = Review.create(review_params)
    if @review.valid?
      redirect_to reviews_path
    else
      flash[:error] = @review.errors.full_messages
      redirect_to new_review_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def review_params
    params.require(:review).permit(:reservation_id, :rating, :content)
  end

end
