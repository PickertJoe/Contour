class CreateTopos < ActiveRecord::Migration[6.0]
  def change
    create_table :topos do |t|

      t.timestamps
    end
  end
end
