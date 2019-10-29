class AddingUserIdToGpx < ActiveRecord::Migration[6.0]
  def change
    add_column :gpxes, :user_id, :integer
  end
end
