class TransactionController < ApplicationController
   
    def buy_amzn
        @transaction = Transaction.sell_amzn(params[:email], params[:amount].to_f)
    end
    
    def sell_amzn
        @transaction = Transaction.sell_amzn(params[:email], params[:amount].to_f)
    end
    
    
end
