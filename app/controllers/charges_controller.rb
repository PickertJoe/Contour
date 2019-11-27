class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    price = Price.find(params[:id])

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: price.value,
      description: "Contour Stripe customer",
      currency: "usd",
    })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end
end
