class AddAddressToAboutMe < ActiveRecord::Migration[6.1]
  def change
    add_column :about_mes, :address, :string
  end
end
