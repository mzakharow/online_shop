class Category < ApplicationRecord
  has_many :products
  mount_uploader :picture, PictureUploader
end
