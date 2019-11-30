class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    price = Price.find(params[:id])

    @charge = Charge.new charge_params.merge(email: stripe_params['stripeEmail'], card_token: stripe_params['stripeToken'])

    raise "Please check payment information" unless @charge.valid?
    @charge.process_payment
    @charge.save

  rescue e
    flash[:error] = e.message
    render :new
  end

  private
    def stripe_params
      params.permit :stripeEmail, :stripeToken
    end
end
