class AddImageUrlToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :image_url, :text
  end
end
