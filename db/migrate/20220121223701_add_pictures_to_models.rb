class AddPicturesToModels < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :picture, :string
  end
end
