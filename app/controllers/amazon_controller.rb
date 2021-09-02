class AmazonController < ApplicationController
    
    def index
    @amazons = Amazon.all
    
    respond_to do |format|
      format.html
      end
    end
    
end
