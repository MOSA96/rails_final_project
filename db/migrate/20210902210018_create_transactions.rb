class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.float :ibm
      t.float :amazon
      t.float :apple
      t.string :sender
      t.string :receiver

      t.timestamps
    end
  end
end
