# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

vending_machine = VendingMachine.create(balance: 0, revenue: 0)
product = Product.create(name: 'Chips', unit_price: 25)
product2 = Product.create(name: 'Doritos', unit_price: 55)
VendingMachineStock.create(vending_machine: vending_machine, product: product, quantity: 30)
VendingMachineStock.create(vending_machine: vending_machine, product: product2, quantity: 50)
