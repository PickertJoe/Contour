class UsingIntegerforGpxData < ActiveRecord::Migration[6.0]
  def change
    remove_column :gpx_data, :time, :string, array: true, default: []
    remove_column :gpx_data, :elevation, :string, array: true, default: []
    add_column :gpx_data, :time, :integer, array: true, default: []
    add_column :gpx_data, :elevation, :integer, array: true, default: []
  end
end
