class VendingMachineStock < ApplicationRecord
  belongs_to :vending_machine
  belongs_to :product
end
