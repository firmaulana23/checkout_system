class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.string :name
      t.integer :table
      t.string :status
      t.string :payment_method
      t.string :transaction_id

      t.timestamps
    end
  end
end
