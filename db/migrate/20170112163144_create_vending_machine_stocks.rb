class CreateVendingMachineStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :vending_machine_stocks do |t|
      t.belongs_to :vending_machine, index: true
      t.belongs_to :product, index: true
      t.integer :quantity
      t.timestamps
    end
  end
end
