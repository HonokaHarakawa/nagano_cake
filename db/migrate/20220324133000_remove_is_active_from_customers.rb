class RemoveIsActiveFromCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :is_flag, from: true, to: false
  end
end
