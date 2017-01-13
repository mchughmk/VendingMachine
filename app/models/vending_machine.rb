class VendingMachine < ApplicationRecord
  has_many :vending_machine_stocks
  has_many :products, through: :vending_machine_stocks
end
