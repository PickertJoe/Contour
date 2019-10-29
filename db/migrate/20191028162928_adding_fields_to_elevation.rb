class AddingFieldsToElevation < ActiveRecord::Migration[6.0]
  def change
    add_column :elevations, :gpx_id, :integer
    add_column :elevations, :chart_title, :string
    add_column :elevations, :x_title, :string
    add_column :elevations, :y_title, :string
    add_column :elevations, :size, :integer
  end
end
