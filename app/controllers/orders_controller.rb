class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    # p @order.line_items
    # @line_items_array = @order.line_items
    # Item


    @line_items_array = @order.line_items
    @line_product = @line_items_array.map {|product| Product.where(id: product.product_id) }
    @combo_arr = @line_items_array.zip @line_product
    # pp @combo_arr
    # @enhanced_checkout = LineItem.where( order_id: params[:id]).map {|product| Product.where(id: product.product_id) }
    


    

    # @enhanced_checkout = LineItem.where( order_id: params[:id]).map {|product| Product.where(id: product.product_id) }
    # @enhanced_checkout_products = @enhanced_checkout.map {|product| { product:product, quantity: cart[product.id.to_s] } }
    # @enhanced_cart ||= LineItem.where(id: LineItem.order_id = ).map {|product| { product:product, quantity: cart[product.id.to_s] } }

    # @enhanced_cart ||= Product.where(id: cart.keys).map {|product| { product:product, quantity: cart[product.id.to_s] } }
  end

  def create
    charge = perform_stripe_charge
    order  = create_order(charge)

    if order.valid?
      empty_cart!
      redirect_to order, notice: 'Your Order has been placed.'
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: "Khurram Virani's Jungle Order",
      currency:    'cad'
    )
  end

  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )

    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end
    order.save!
    order
  end

end
