class CreateElevations < ActiveRecord::Migration[6.0]
  def change
    create_table :elevations do |t|

      t.timestamps
    end
  end
end
