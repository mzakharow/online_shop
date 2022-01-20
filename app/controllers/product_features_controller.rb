class ProductFeaturesController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @product.product_features.create(product_feature_params)

    redirect_to product_path(@product)
  end

  # def update
  #   respond_to do |format|
  #     if @product.update(product_params)
  #       format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
  #       format.json { render :show, status: :ok, location: @product }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @product.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  private

  def product_feature_params
    params.require(:product_feature).permit(:name, :value, :product_id)
  end

  # before_action :set_product
  #
  # def create
  #   @product.product_features.create! params.required(:product_features).permit(:name, :value)
  #   redirect_to @product
  # end
  #
  # private
  # def set_product
  #   @product = Product.find(params[:product_id])
  # end
end