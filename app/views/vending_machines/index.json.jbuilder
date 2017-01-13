json.array!(@vending_machines) do |vending_machine|
  json.extract! vending_machine, :id, :revenue
  json.url vending_machine_url(vending_machine, format: :json)
end
