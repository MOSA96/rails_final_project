class Apple < ApplicationRecord
    include Markets
    #Stock.delete_all
    class << self
        
        $model_market = Apple
        
        def download
            #model_market = Stock
            link = 'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=AAPL&outputsize=full&apikey=S1DX8G3G38PEA0Rd'
            download_data($model_market, link)
        end    
        
        def update
            #model_market = Stock
            compact_link = 'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=AAPL&outputsize=compact&apikey=S1DX8G3G38PEA0Rd'
            update_data($model_market, compact_link)
        end
            
            
    end
end
