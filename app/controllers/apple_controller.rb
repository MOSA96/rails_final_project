class AppleController < ApplicationController
    
    def index
    @apples = Apple.all
    
    respond_to do |format|
      format.html
      end
    end
    
end
