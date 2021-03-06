class StocksController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @q = Stock.ransack(params[:q])
    @stock = @q.result(distinct: true) 
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)

    @stock.user = current_user
    if @stock.save
      redirect_to do |format|
        format.html { redirect_to @stock }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    if @stock.update(stock_params)
      redirect_to do |format|
        format.html { redirect_to @stock }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @stock = Stock.find(params[:id])
    p @stock
    @stock.destroy
    redirect_to root_path
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :qty, :main_image)
  end
end
