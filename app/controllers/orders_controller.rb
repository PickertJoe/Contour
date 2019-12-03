class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    Order.transaction do
      order = current_user.orders.new(order_params)
      order.total_amount_in_cents = order.price_for_graph
      order.save!

      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })

      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: order.total_amount_in_cents,
        description: 'Rails Stripe customer',
        currency: 'usd',
      })

      redirect_to order_path(order)
    end


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_path
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = e.message
    redirect_to e.record.graph
  end

  private

  def order_params
    params.require(:order).permit(:graph_id, :graph_type)
  end
end
