class MovingUnitstoElevationGraph < ActiveRecord::Migration[6.0]
  def change
    remove_column :gpxes, :units, :integer
    add_column :elevation_graphs, :units, :integer
  end
end
