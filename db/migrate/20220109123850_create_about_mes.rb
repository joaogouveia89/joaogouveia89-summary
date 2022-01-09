class CreateAboutMes < ActiveRecord::Migration[6.1]
  def change
    create_table :about_mes do |t|
      t.text :description
      t.string :email
      t.string :phone
      t.string :current_city

      t.timestamps
    end
  end
end
