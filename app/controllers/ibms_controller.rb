class IbmsController < ApplicationController
  
  def index
    @ibms = Ibm.all
    
    respond_to do |format|
      format.html
      end
  end
  
end
