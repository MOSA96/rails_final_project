class AddSellBuyToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :sell, :boolean
    add_column :transactions, :buy, :boolean
  end
end
