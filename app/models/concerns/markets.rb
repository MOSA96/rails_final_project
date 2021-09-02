module Markets
    extend ActiveSupport::Concern
    
    module ClassMethods
        
        def prepare_data(data_link)
            result = Net::HTTP.get(URI.parse(data_link)) 
            json = JSON.parse(result).to_hash
            data = json["Time Series (Daily)"]
            date = data.keys
            opens = []
            high = []
            low = []
            close = []
            volume = []
            
            return data, date, opens=[], high=[], low=[], close=[], volume=[]
        end
        
        def add_data(data, date, opens, high, low, close, volume, index, market)
            
            data.each do |line|
            
              opens.push(line[index]["1. open"])
              high.push(line[index]["2. high"])
              low.push(line[index]["3. low"])
              close.push(line[index]["4. close"])
              volume.push(line[index]["5. volume"])
              
            end 
            
            populate = date.zip(opens,high,low, close, volume)
            data_to_populate = populate.map{|e| {date:e[0], opens:e[1], high:e[2], low:e[3], close:e[4], volume:e[5]}}
            
            data_to_populate.each do |attribute|
             stock = market.new
             stock.date = attribute[:date]
             stock.close = attribute[:close]
             stock.high = attribute[:high]
             stock.open = attribute[:opens]
             stock.low = attribute[:low]
             stock.volume =attribute[:volume]
             stock.save
            end 
            
        end
        
        
        def download_data(market, market_link)
            market.delete_all
            data, date, opens, high, low, close, volume = prepare_data(market_link)
            add_data(data, date,opens, high, low, close, volume , 1, market)
        end
        
        def update_data(market, market_link)
            todays_date = Time.now.strftime("%Y-%m-%d")
            data, date, opens, high, low, close, volume = prepare_data(market_link)
            validate_date = market.pluck(:date)
            
            
                if validate_date.include? todays_date
                    print "Data is updated"
                else
                    begin
                    add_data(data, date,opens, high, low, close, volume , todays_date, market)
                    rescue
                        print "Data is not available!"
                    end
                end
        end
        
        
        
        
    end
    
end