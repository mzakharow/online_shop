json.extract! product, :id, :title, :image, :available, :description, :quantity, :price, :brand_id, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
