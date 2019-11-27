class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    price = Price.find(params[:id])

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Contour canvas purchase",
        description: price.priceable_type,
        amount: price.value,
        currency: 'usd',
        quantity: 1
      }],
      success_url: user_gpxes_path,
      cancel_url: root_path,
    )

    # customer = Stripe::Customer.create({
    #   email: params[:stripeEmail],
    #   source: params[:stripeToken],
    # })

    # charge = Stripe::Charge.create({
    #   customer: customer.id,
    #   amount: price.value,
    #   description: "Contour Stripe customer",
    #   currency: "usd",
    # })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end
end
