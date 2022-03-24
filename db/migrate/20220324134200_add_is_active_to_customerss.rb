class AddIsActiveToCustomerss < ActiveRecord::Migration[5.2]
  def change
    add_column :customersses, :is_active, :boolean
  end
end
