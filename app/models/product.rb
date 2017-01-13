class Product < ApplicationRecord
  has_many :vending_machine_stocks
  has_many :vending_machines, through: :vending_machine_stocks
end
