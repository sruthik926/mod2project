class SearchesController < ApplicationController
  def new
    @search = Search.new
    render :new
  end

  def create
    @search = Search.create!(search_params)
    redirect_to search_path(@search.id)
  end

  def show
    @search = Search.find(params[:id])
    render :show
  end

  private
  def search_params
    params.require(:search).permit(:origin, :destination, :departure_date, :return_date)
  end
end
