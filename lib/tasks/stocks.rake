desc "Print remind to update the stocks databases from monday to friday."

task :update_message do
  puts "Update the stocks databases from monday to friday!"
end

task :update_markets=> :environment do
    
    markets = ["Ibm", "Amazon", "Apple"]
    
    markets.each do |market|
        market_to_update = market.constantize
        market_to_update.update
    end
    
 end
 
 task :update_ibm=> :environment do
    
    Ibm.download
 end  
    
    task :update_apple=> :environment do
    
        Apple.download
 end 
    
 task :update_amazon=> :environment do
    
    Amazon.download
 end 