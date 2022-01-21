class CartItemsController < ApplicationController
  include CurrentCart
  require 'product'

  before_action :set_cart, only: [:create]
  before_action :set_cart_item, only: %i[ show edit update destroy ]

  def index
    @cart_items = CartItem.all
  end

  def show
  end

  def new
    @cart_item = CartItem.new
  end

  def edit
  end

  def create
    # @cart_item = CartItem.new(cart_item_params)
    # product = Product.find(params[:product_id]) # Product.find(params[:item]) ?!?!
    # @cart_item = @cart.add_product(product.id)

    product = Product.find(params[:product_id])
    puts product.id
    @cart_item = @cart.cart_items.build(product: product)

    respond_to do |format|
      if @cart_item.save
        # format.html { redirect_to cart_item_url(@cart_item), notice: "Cart item was successfully created." }
        format.html { redirect_to edit_cart_path(@cart)}
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to cart_item_url(@cart_item), notice: "Cart item was successfully updated." }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart_item.destroy

    respond_to do |format|
      format.html { redirect_to cart_items_url, notice: "Cart item was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      params.require(:cart_item).permit(:quantity_item, :product_id, :cart_id)
    end
end
