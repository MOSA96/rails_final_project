class RemoveColumnsFromTransactions < ActiveRecord::Migration[6.1]
    def self.up
    remove_column :transactions, :ibm
    remove_column :transactions, :amazon
    remove_column :transactions, :apple
    add_column :transactions, :market, :string
    add_column :transactions, :amount, :integer
    end
    
    def self.down
      add_column :transactions, :ibm, :integer
      add_column :transactions, :amazon, :integer
      add_column :transactions, :apple, :integer
      remove_column :transactions, :market
    end
    
    
end
