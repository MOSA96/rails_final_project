class Stock < ApplicationRecord
    
    #Stock.delete_all
    class << self
        
        def download_data
            Stock.delete_all
            result = Net::HTTP.get(URI.parse('https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=IBM&outputsize=full&apikey=S1DX8G3G38PEA0Rd')) 
            json = JSON.parse(result).to_hash
            data = json["Time Series (Daily)"]
            date = data.keys
            opens = []
            high = []
            low = []
            close = []
            volume = []
            
            data.each do |line|
            
              opens.push(line[1]["1. open"])
              high.push(line[1]["2. high"])
              low.push(line[1]["3. low"])
              close.push(line[1]["4. close"])
              volume.push(line[1]["5. volume"])
              
            end
            
            populate = date.zip(opens,high,low, close, volume)
            data_to_populate = populate.map{|e| {date:e[0], opens:e[1], high:e[2], low:e[3], close:e[4], volume:e[5]}}
            
            data_to_populate.each do |attribute|
             stock = Stock.new
             stock.date = attribute[:date]
             stock.close = attribute[:close]
             stock.high = attribute[:high]
             stock.open = attribute[:opens]
             stock.low = attribute[:low]
             stock.volume =attribute[:volume]
             stock.save
            end 
        end
        
        
        def update_data
            todays_date = Time.now.strftime("%Y-%m-%d")
            result = Net::HTTP.get(URI.parse('https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=IBM&outputsize=compact&apikey=S1DX8G3G38PEA0Rd')) 
            json = JSON.parse(result).to_hash
            data = json["Time Series (Daily)"]
            validate_date = Stock.pluck(:date)
            date = data.keys
            opens = []
            high = []
            low = []
            close = []
            volume = []
            
            
                if validate_date.include? todays_date
                    print "Data is updated"
                else
                    begin
                      opens.push(data[todays_date]["1. open"])
                      high.push(data[todays_date]["2. high"])
                      low.push(data[todays_date]["3. low"])
                      close.push(data[todays_date]["4. close"])
                      volume.push(data[todays_date]["5. volume"])
                      
                      populate = date.zip(opens,high,low, close, volume)
                      data_to_populate = populate.map{|e| {date:e[0], opens:e[1], high:e[2], low:e[3], close:e[4], volume:e[5]}}
                      
                      data_to_populate.each do |attribute|
                      stock = Stock.new
                      stock.date = attribute[:date]
                      stock.close = attribute[:close]
                      stock.high = attribute[:high]
                      stock.open = attribute[:opens]
                      stock.low = attribute[:low]
                      stock.volume =attribute[:volume]
                      stock.save
                      end 
                      
                    rescue
                        print "Data is not available!"
                    end
                end
        end
            
            
            
    end
            
end
