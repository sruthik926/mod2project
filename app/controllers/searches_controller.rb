class SearchesController < ApplicationController
  def new
    @search = Search.new
    @flights = Flight.select('DISTINCT state')
    @returnflights = Flight.select('DISTINCT destination_state')
    render :new
  end

  def create
    @search = Search.create(search_params)

    if @search.valid?

      redirect_to search_path(@search.id)
    else
      flash[:error] = @search.errors.full_messages
      redirect_to new_search_path
    end
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
