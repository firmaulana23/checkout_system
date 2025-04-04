class Order < ApplicationRecord
  belongs_to :user

  validates :menu_item, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :total_price, numericality: { greater_than_or_equal_to: 0 }

  enum payment_status: { pending: 0, completed: 1, failed: 2 }

  # Additional methods related to order processing can be added here
end