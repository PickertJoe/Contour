class RenamingGraphModels < ActiveRecord::Migration[6.0]
  def change
    rename_table :topos, :topographicmaps
    rename_table :elevations, :elevationgraphs
  end
end
