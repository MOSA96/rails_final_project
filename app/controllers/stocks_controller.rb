class StocksController < ApplicationController
  
  def index
    @stocks = Stock.all
    
    respond_to do |format|
      format.html
      end
  end
  
end
