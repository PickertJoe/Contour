class AddingGpxIdtoDataModel < ActiveRecord::Migration[6.0]
  def change
    add_column :gpx_data, :gpx_id, :integer
  end
end
