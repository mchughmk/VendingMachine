class CreateVendingMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :vending_machines do |t|
      t.integer :balance
      t.integer :revenue
      t.timestamps
    end
  end
end
