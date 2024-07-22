class CartsController < ApplicationController
  before_action :set_order, only: [:add_item, :show]

  def add_item
    product = Product.find(params[:product_id])
    @cart_item = @order.order_items.find_or_initialize_by(product: product)

    if @cart_item.new_record?
      @cart_item.quantity = 1
      @cart_item.unit_price = product.price # Assurez-vous que le prix est défini
    else
      @cart_item.quantity += 1
    end

    if @cart_item.save
      redirect_to cart_path, notice: 'Product was successfully added to your cart.'
    else
      redirect_to product_path(product), alert: 'There was a problem adding the product to your cart.'
    end
  end

  def show
    @order_items = @order.order_items
  end

  private

  def set_order
    @order = Order.find_or_initialize_by(user: current_user, status: 'cart')
    if @order.new_record?
      @order.total_price = 0
      @order.save
    end
  end
end
