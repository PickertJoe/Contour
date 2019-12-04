class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.float :value
      t.references :priceable, polymorphic: true, index: true
    end
  end
end
