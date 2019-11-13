class ChangingGpxDatumToPostgresArray < ActiveRecord::Migration[6.0]
  def change
    remove_column :gpx_data, :time, :string
    remove_column :gpx_data, :elevation, :string
    add_column :gpx_data, :time, :string, array: true, default: []
    add_column :gpx_data, :elevation, :string, array: true, default: []
  end
end
