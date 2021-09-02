class CreateAmazons < ActiveRecord::Migration[6.1]
  def change
    create_table :amazons do |t|
      t.datetime :date
      t.float :close
      t.float :open
      t.float :high
      t.float :low
      t.float :volume

      t.timestamps
    end
  end
end
