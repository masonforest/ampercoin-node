class ChangeAmountToDecimal < ActiveRecord::Migration
  def change
    change_column :transactions, :amount, :decimal, precision: 16, scale: 8
  end
end
