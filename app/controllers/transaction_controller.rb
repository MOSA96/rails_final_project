class TransactionController < ApplicationController
    
    
    def buy
        Transaction.create(receiver: params[:email], market: params[:markets], amount: params[:amount], buy: true, sell: false) 
        Transaction.buy(params[:email], params[:amount].to_f, params[:markets])
    end
    
    def sell
        Transaction.create(receiver: params[:email], market: params[:markets], amount: params[:amount], buy: false, sell: true) 
        Transaction.sell(params[:email], params[:amount].to_f, params[:markets])
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    def buy_amzn
        Transaction.create(receiver: params[:email], amazon: params[:amount], buy: true, sell: false) 
        Transaction.buy_amzn(params[:email], params[:amount].to_f)
    end
    
    def sell_amzn
        Transaction.create(receiver: params[:email], amazon: params[:amount], buy: false, sell: true) 
        Transaction.sell_amzn(params[:email], params[:amount].to_f)
    end
    
    def buy_ibm
        print params
        Transaction.create(receiver: params[:email], ibm: params[:amount], buy: true, sell: false) 
        Transaction.buy_ibm(params[:email], params[:amount].to_f)
    end
    
    def sell_ibm
        Transaction.create(receiver: params[:email], ibm: params[:amount], buy: false, sell: true) 
        Transaction.sell_ibm(params[:email], params[:amount].to_f)
    end
    
    def buy_apple
        Transaction.create(receiver: params[:email], apple: params[:amount], buy: true, sell: false) 
        Transaction.buy_appl(params[:email], params[:amount].to_f)
    end
    
    def sell_apple
        Transaction.create(receiver: params[:email], apple: params[:amount], buy: false, sell: true) 
        Transaction.sell_appl(params[:email], params[:amount].to_f)
    end
    

end
