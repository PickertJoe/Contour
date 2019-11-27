class ChangingPricetoInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :prices, :value, :integer
  end
end
