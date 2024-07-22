class CheckoutsController < ApplicationController
  def create
    @order = current_user.orders.find_by(status: 'cart')
    @order.update(status: 'pending')

    line_items = @order.order_items.map do |item|
      {
        price_data: {
          currency: 'usd',
          product_data: {
            name: item.product.name,
            images: [item.product.image_url]
          },
          unit_amount: (item.unit_price * 100).to_i # Stripe amount in cents
        },
        quantity: item.quantity
      }
    end

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_items,
      mode: 'payment',
      success_url: root_url,
      cancel_url: cart_url
    )

    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order_id: @order.id)
  rescue => e
    redirect_to cart_path, alert: "There was a problem creating the checkout session: #{e.message}"
  end
end
