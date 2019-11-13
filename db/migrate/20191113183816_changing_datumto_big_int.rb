class ChangingDatumtoBigInt < ActiveRecord::Migration[6.0]
  def change
    change_column :gpx_data, :time, :integer, limit: 8, array: true, default: []
    change_column :gpx_data, :elevation, :integer, limit: 8, array: true, default: []
  end
end
