class CorrectingGraphTableNames < ActiveRecord::Migration[6.0]
  def change
    rename_table :topographicmaps, :topographic_maps
    rename_table :elevationgraphs, :elevation_graphs
  end
end
