class RemovingDefaultFromGpxDatum < ActiveRecord::Migration[6.0]
  def change
    change_column :gpx_data, :time, :integer, limit: 8, array: true
    change_column :gpx_data, :elevation, :integer, limit: 8, array: true
  end
end
