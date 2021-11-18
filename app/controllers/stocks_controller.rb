class StocksController < ApplicationController
  def index
    @stock = Stock.all
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    @stock.save if redirect_to @stock
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    redirect_to @stock if  @stock.update(stock_params)
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy
    redirect_to root_path
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :qty)
  end
end
