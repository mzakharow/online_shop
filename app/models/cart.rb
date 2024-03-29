class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def add_product(product_id)
    current_item = cart_items.find_by(product_id: product_id)

    if current_item
      current_item.quantity_item += 1
    else
      current_item = cart_items.build(product_id: product_id, quantity_item: 1)
    end
    current_item
  end

  def total_price
    cart_items.to_a.sum { |item| item.total_price }
  end
end
