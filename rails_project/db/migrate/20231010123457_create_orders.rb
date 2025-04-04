class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :menu_item, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :payment_status, default: 'pending'

      t.timestamps
    end
  end
end