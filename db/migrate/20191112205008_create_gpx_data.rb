class CreateGpxData < ActiveRecord::Migration[6.0]
  def change
    create_table :gpx_data do |t|
      t.string  :time
      t.string  :elevation
      t.timestamps
    end
  end
end
