class AddRatingToHotels < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :rating, :float
  end
end
