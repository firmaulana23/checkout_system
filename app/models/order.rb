class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :menus, through: :order_items

  validates :status, inclusion: { in: %w[pending paid failed] }
end
# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  total_price    :integer
#  name           :string       # Name of the customer
#  table          :integer      # Table number
#  status         :string       # Order status (e.g., pending, paid, failed)
#  payment_method :string       # Payment method (e.g., cash, credit card)
#  transaction_id :string       # Transaction ID for payment
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_orders_on_transaction_id  (transaction_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (transaction_id => transactions.id)
#
