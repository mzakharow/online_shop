class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  has_many :product_features, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  mount_uploader :picture, PictureUploader

  max_paginates_per 9
end
