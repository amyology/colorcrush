json.array! @products.each do |product|
  json.id product.id
  json.name product.name
  json.brand product.brand
  json.product_type product.product_type
  json.image product.image
  json.color_id product.color_id
end