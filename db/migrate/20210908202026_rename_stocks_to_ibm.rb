class RenameStocksToIbm < ActiveRecord::Migration[6.1]
  def change
     rename_table :stocks, :ibms
  end
end
