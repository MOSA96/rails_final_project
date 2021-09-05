class TransactionController < ApplicationController
    

    def buy_amzn
        @transaction = Transaction.create(transaction_params) 
        @transaction2 = Transaction.buy_amzn(params[:email], params[:amount].to_f)
    end
    
    def sell_amzn
        @transaction = Transaction.sell_amzn(params[:email], params[:amount].to_f)
    end
    
    def buy_ibm
        @transaction = Transaction.buy_ibm(params[:email], params[:amount].to_f)
    end
    
    def sell_ibm
        @transaction = Transaction.sell_ibm(params[:email], params[:amount].to_f)
    end
    
    def buy_apple
        @transaction = Transaction.buy_appl(params[:email], params[:amount].to_f)
    end
    
    def sell_apple
        @transaction = Transaction.sell_appl(params[:email], params[:amount].to_f)
    end
    
    def transaction_params
        params.permit(:ibm, :amazon, :apple, :sender, :receiver)
    end
end
