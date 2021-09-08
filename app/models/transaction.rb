class Transaction < ApplicationRecord
    has_one :user
    
    class << self
        
        $yesterday_date =  Date.yesterday.yesterday.yesterday.yesterday.yesterday.strftime("%Y-%m-%d")
        $master_account = "master@master.com" 
        
        
        def buy(buyer_mail, amount, market)
            ActiveRecord::Base.transaction do
                market = market.titleize
                market_constantize = market.constantize
                market_sym = market.downcase.to_sym
                price = market_constantize.find_by(date: $yesterday_date).close
                total_price = amount * price
                user =  User.find_by(email: buyer_mail).send(market.downcase)
                user_funds = User.find_by(email: buyer_mail).funds
                master = User.find_by(email: $master_account).send(market.downcase)
                master_funds = User.find_by(email: $master_account).funds
                
                User.find_by(email: $master_account).update_attribute(market_sym, master-amount)
                User.find_by(email: $master_account).update_attribute(:funds, master_funds + total_price)
                User.find_by(email: buyer_mail).update_attribute(:funds, user_funds - total_price )
                User.find_by(email: buyer_mail).update_attribute(market_sym, user  + amount )
            end
                
        end    
        
        
        def sell(buyer_mail, amount, market)
            ActiveRecord::Base.transaction do
                market = market.titleize
                market_constantize = market.constantize
                market_sym = market.downcase.to_sym
                price = market_constantize.find_by(date: $yesterday_date).close
                total_price = amount * price
                user =  User.find_by(email: buyer_mail).send(market.downcase)
                user_funds = User.find_by(email: buyer_mail).funds
                master = User.find_by(email: $master_account).send(market.downcase)
                master_funds = User.find_by(email: $master_account).funds
                
                User.find_by(email: $master_account).update_attribute(market_sym, master+amount)
                User.find_by(email: $master_account).update_attribute(:funds, master_funds - total_price)
                User.find_by(email: buyer_mail).update_attribute(:funds, user_funds + total_price )
                User.find_by(email: buyer_mail).update_attribute(market_sym, user  - amount )
            end
                
        end    
        
    end
    
    
end
