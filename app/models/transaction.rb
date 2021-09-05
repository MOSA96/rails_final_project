class Transaction < ApplicationRecord
    has_many :users 
    
    class << self
        
        yesterday_date =  Date.yesterday.yesterday.strftime("%Y-%m-%d")
        $master_account = "master@master.com" 
        $ibm_price =  Stock.find_by(date: yesterday_date).close
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
        
        def buy_appl(buyer_mail, amount)
            ActiveRecord::Base.transaction do
                total_price = amount * $apple_price
                
                master_apple = User.find_by(email: $master_account).apple
                master_funds = User.find_by(email: $master_account).funds
                User.find_by(email: $master_account).update_attribute(:apple, master_apple - amount )
                User.find_by(email: $master_account).update_attribute(:funds, master_funds + total_price )
                
                user_apple =  User.find_by(email: buyer_mail).apple
                user_funds = User.find_by(email: buyer_mail).funds
                User.find_by(email: buyer_mail).update_attribute(:funds, user_funds - total_price )
                User.find_by(email: buyer_mail).update_attribute(:apple, user_apple  + amount )
            end
        end
        
        
        def sell_appl(seller_mail, amount)
            ActiveRecord::Base.transaction do
                total_price = amount * $apple_price
                
                master_apple = User.find_by(email: $master_account).apple
                master_funds = User.find_by(email: $master_account).funds
                User.find_by(email: $master_account).update_attribute(:apple, master_apple + amount )
                User.find_by(email: $master_account).update_attribute(:funds, master_funds - total_price )
                
                user_apple =  User.find_by(email: seller_mail).apple
                user_funds = User.find_by(email: seller_mail).funds
                User.find_by(email: seller_mail).update_attribute(:funds, user_funds + total_price )
                User.find_by(email: seller_mail).update_attribute(:apple, user_apple - amount )
            end
        end
        
        
        def buy_ibm(buyer_mail, amount)
            ActiveRecord::Base.transaction do
                total_price = amount * $ibm_price
                
                master_ibm = User.find_by(email: $master_account).ibm
                master_funds = User.find_by(email: $master_account).funds
                User.find_by(email: $master_account).update_attribute(:ibm, master_ibm - amount )
                User.find_by(email: $master_account).update_attribute(:funds, master_funds + total_price )
                
                user_ibm =  User.find_by(email: buyer_mail).ibm
                user_funds = User.find_by(email: buyer_mail).funds
                User.find_by(email: buyer_mail).update_attribute(:funds, user_funds - total_price )
                User.find_by(email: buyer_mail).update_attribute(:ibm, user_ibm  + amount )
            end
        end
        
        
        def sell_ibm(seller_mail, amount)
            ActiveRecord::Base.transaction do
                total_price = amount * $ibm_price
                
                master_ibm = User.find_by(email: $master_account).ibm
                master_funds = User.find_by(email: $master_account).funds
                User.find_by(email: $master_account).update_attribute(:apple, master_ibm + amount )
                User.find_by(email: $master_account).update_attribute(:funds, master_funds - total_price )
                
                user_ibm =  User.find_by(email: seller_mail).ibm
                user_funds = User.find_by(email: seller_mail).funds
                User.find_by(email: seller_mail).update_attribute(:funds, user_funds + total_price )
                User.find_by(email: seller_mail).update_attribute(:apple, user_ibm - amount )
            end
        end
        
        
    end
    
    
end
