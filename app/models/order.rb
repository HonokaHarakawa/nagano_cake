class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { wating: 0, confirmation: 1, production: 2, preparing: 3, sent: 4 }
end
