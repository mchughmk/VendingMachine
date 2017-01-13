class VendingMachineController < ApplicationController

  def index
    @vending_machine = VendingMachine.find(1)
    @balance = 0
    @params = {vending_machine: @vending_machine, balance: @balance}
  end

  ##old methods to add and return money, replaced with jquery functionality
  def add_money
    amount = params[:amount].to_i
    @vending_machine = VendingMachine.find(1)
    @vending_machine.balance += amount
    @vending_machine.save()

    redirect_to '/'
  end

  def return_money
    @vending_machine = VendingMachine.find(1)
    @vending_machine.balance = 0
    @vending_machine.save()

    redirect_to '/'
  end

  def vend
    @vending_machine = VendingMachine.find(1)
    user_balance = params[:balance].to_i
    revenue = 0
    product_array = to_integer_array(params[:products])
    quantity_array = to_integer_array(params[:quantities])
    product_dict = {}

    product_array.each_with_index { |product_id, index|
      product = Product.find(product_id)
      product_stock = product.vending_machine_stock(@vending_machine.id)
      product_stock.quantity -= quantity_array[index]
      product_stock.save()
      product_price = product.unit_price
      user_balance -= product_price * quantity_array[index]
      revenue += product_price * quantity_array[index]

      product_dict[product.name.to_sym] = quantity_array[index]
    }

    @vending_machine.revenue += revenue
    @vending_machine.save()
    @balance = user_balance
    @product_dict = product_dict

    render 'index'
  end

  def to_integer_array(string)
    string.split(",").map { |s| s.to_i }
  end

end
