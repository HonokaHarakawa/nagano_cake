class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order_detail
end
