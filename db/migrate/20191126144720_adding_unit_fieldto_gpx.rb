class AddingUnitFieldtoGpx < ActiveRecord::Migration[6.0]
  def change
    add_column :gpxes, :units, :integer
  end
end
