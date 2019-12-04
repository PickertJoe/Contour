class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :graph, null: false, polymorphic: true
      t.integer :total_amount_in_cents, null: false

      t.timestamps
    end
  end
end
