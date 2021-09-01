class StaticPagesController < ApplicationController
  
  def home
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def market
    @stocks = Stock.all
    respond_to do |format|
      format.html
    end
  end



end
