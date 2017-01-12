class Product < ApplicationRecord
  attr_reader :name
  attr_accessor :unit_price
  has_many :vending_machine_stocks
  has_many :vending_machines, through: :vending_machine_stocks

  def initialize(name, unit_price)
    @unit_price = unit_price
    @name = name
  end

end
