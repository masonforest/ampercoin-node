class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :address
      t.string :public_key

      t.timestamps
    end
  end
end
