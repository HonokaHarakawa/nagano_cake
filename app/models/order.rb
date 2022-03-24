class Order < ApplicationRecord
  has_many :order_details 
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { wating: 0, confirmation: 1, production: 2, preparing: 3, sent: 4 }
  
  def with_tax_price
      (price * 1.1).floor
  end

end