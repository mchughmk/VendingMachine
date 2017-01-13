json.array!(@vending_machine_stocks) do |vending_machine_stock|
  json.extract! vending_machine_stock, :id, :vending_machine_id, :product_id, :quantity
  json.url vending_machine_stock_url(vending_machine_stock, format: :json)
end
