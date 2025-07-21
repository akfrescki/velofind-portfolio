class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])

    session = Stripe::Checkout::Session.retrieve(@order.checkout_session_id)
    if session.payment_status == "paid"
      @order.update(state: "paid")
    end
  end

  def checkout
    bike = Bike.find(params[:bike_id])


    existing_order = Order.find_by(user: current_user, bike: bike, state: 'paid')
    if existing_order
      redirect_to bike_matches_path(bike), notice: "You've already paid for this bike."
      return
    end

    order = Order.create!(
      bike: bike,
      user: current_user,
      bike_brand: bike.brand,
      frame_number: bike.frame_number
    )

    authorize order

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      mode: 'payment',
      success_url: "#{bike_matches_url(bike)}?payment=success&session_id={CHECKOUT_SESSION_ID}",
      cancel_url: bike_matches_url(bike),
      line_items: [{
        price_data: {
          currency: 'eur',
          product_data: {
            name: "Match access for #{bike.brand} - #{bike.frame_number}"
          },
          unit_amount: 699,
        },
        quantity: 1
      }]
    )

    order.update(checkout_session_id: session.id)
    redirect_to session.url, allow_other_host: true
  end
end
