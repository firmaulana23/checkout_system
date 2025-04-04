class Menu < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items
end

# == Schema Information
#
# Table name: menus
#
#  id         :bigint           not null, primary key
#  name       :string
#  description: string
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
