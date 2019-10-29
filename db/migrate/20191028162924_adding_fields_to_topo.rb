class AddingFieldsToTopo < ActiveRecord::Migration[6.0]
  def change
    add_column :topos, :gpx_id, :integer
    add_column :topos, :chart_title, :string
    add_column :topos, :size, :integer
  end
end
