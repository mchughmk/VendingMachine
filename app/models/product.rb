class Product < ApplicationRecord
  has_many :vending_machine_stocks
  has_many :vending_machines, :through => :vending_machine_stocks

  def vending_machine_stock(vending_machine_id)
    ##stock_object = VendingMachineStock.where("vending_machine_id = ?_id AND product_id = ?", vending_machine_id, self.id)
    stock_object = VendingMachineStock.where(vending_machine_id: vending_machine_id).where(product_id: self.id)
    return stock_object.first
  end
end
