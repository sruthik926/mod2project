class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    render :index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

end
