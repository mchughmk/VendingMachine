json.array!(@products) do |product|
  json.extract! product, :id, :name, :unit_price
  json.url product_url(product, format: :json)
end
