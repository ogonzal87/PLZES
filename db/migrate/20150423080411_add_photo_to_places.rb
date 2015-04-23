class AddPhotoToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :photo, :text
  end
end
