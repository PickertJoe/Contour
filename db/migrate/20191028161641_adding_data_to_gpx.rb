class AddingDataToGpx < ActiveRecord::Migration[6.0]
  def change
    add_column :gpxes, :name, :string
    add_column :gpxes, :activity, :integer
  end
end
