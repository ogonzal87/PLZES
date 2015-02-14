class RemovePhoneNumberFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :phone_number, :string
  end
end
