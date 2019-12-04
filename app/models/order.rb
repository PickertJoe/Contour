class Order < ApplicationRecord
  belongs_to :user
  belongs_to :graph, polymorphic: true

  validates_presence_of :total_amount_in_cents

  def price_for_graph
    graph.price
  end

  def readable_price
    '$' + '%.2f' % (total_amount_in_cents.to_i/100.0)
  end
end
