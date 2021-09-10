class TransactionController < ApplicationController
    
    def buy
        ActiveRecord::Base.transaction do
            Transaction.create(receiver: params[:email], market: params[:markets], amount: params[:amount] ,buy: true, sell: false, user_id: current_user.id) 
            Transaction.buy(params[:email], params[:amount].to_f, params[:markets])
        end    
    end
    
    def sell
        ActiveRecord::Base.transaction do
            Transaction.create(receiver: params[:email], market: params[:markets], amount: params[:amount], buy: false, sell: true, user_id: current_user.id) 
            Transaction.sell(params[:email], params[:amount].to_f, params[:markets])
        end 
    end
    
end
