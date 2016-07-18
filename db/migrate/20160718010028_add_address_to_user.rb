class AddAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :street_address1, :string
    add_column :users, :street_address2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :string
  end
end
