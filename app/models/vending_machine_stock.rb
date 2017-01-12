class VendingMachineStock < ApplicationRecord
  belongs_to :vending_machine
  belongs_to :product
  attr_accessor :quantity
end
