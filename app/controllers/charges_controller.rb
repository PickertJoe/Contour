class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      # This is a temporary placeholder
      # I need to find a way to pass the price of the topo/elevation profile
      # To this controller
      amount: 50,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
