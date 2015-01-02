class AddSignatureToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :signature, :string
  end
end
