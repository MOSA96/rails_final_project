class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :ibm, :float
    add_column :users, :amazon, :float
    add_column :users, :apple, :float
  end
end
