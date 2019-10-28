class CreateGpxes < ActiveRecord::Migration[6.0]
  def change
    create_table :gpxes do |t|

      t.timestamps
    end
  end
end
