class Transaction < ApplicationRecord
    has_many :users 
    
    class << self
        
        yesterday_date =  Date.yesterday.yesterday.strftime("%Y-%m-%d")
        $master_account = "master@master.com" 
        $stock_price =  Stock.find_by(date: yesterday_date).close
        $amazon_price =  Amazon.find_by(date: yesterday_date).close
        $apple_price =  Apple.find_by(date: yesterday_date).close
        
        
        
        def buy_amzn(buyer_mail, amount)
            ActiveRecord::Base.transaction do
                total_price = amount * $amazon_price
                
                master_amzn = User.find_by(email: $master_account).amazon
                master_funds = User.find_by(email: $master_account).funds
                User.find_by(email: $master_account).update_attribute(:amazon, master_amzn - amount )
                User.find_by(email: $master_account).update_attribute(:funds, master_funds + total_price )
                
                user_amzn =  User.find_by(email: buyer_mail).amazon
                user_funds = User.find_by(email: buyer_mail).funds
                User.find_by(email: buyer_mail).update_attribute(:funds, user_funds - total_price )
                User.find_by(email: buyer_mail).update_attribute(:amazon, user_amzn  + amount )
            end
        end
        
        
        def sell_amzn(seller_mail, amount)
            ActiveRecord::Base.transaction do
                total_price = amount * $amazon_price
                
                master_amzn = User.find_by(email: $master_account).amazon
                master_funds = User.find_by(email: $master_account).funds
                User.find_by(email: $master_account).update_attribute(:amazon, master_amzn + amount )
                User.find_by(email: $master_account).update_attribute(:funds, master_funds - total_price )
                
                user_amzn =  User.find_by(email: seller_mail).amazon
                user_funds = User.find_by(email: seller_mail).funds
                User.find_by(email: seller_mail).update_attribute(:funds, user_funds + total_price )
                User.find_by(email: seller_mail).update_attribute(:amazon, user_amzn  - amount )
            end
        end
        
        #def buy(receiver_mail, market, amount)
            #ActiveRecord::Base.transaction do
                #retire($master_account, amount)
                #receive(receiver_mail, amount)
            #end
        #end
        
        #def retire(sender_mail, market, amount)
            #savings = market.find_by(email: sender_mail).saving
            #market.find_by(email: sender_mail).update(saving:(savings-amount))
        #end
    
        #def receive(receiver_mail, market, amount)
            #savings = market.find_by(email: receiver_mail).saving
            #market.find_by(email: receiver_mail).update(saving:(savings+amount))
        #end
    
    
        #def transfer(sender_mail, receiver_mail, amount)
            #ActiveRecord::Base.transaction do
                #retire(sender_mail, amount)
                #receive(receiver_mail, amount)
            #end
        #end
    end
    
    
end
