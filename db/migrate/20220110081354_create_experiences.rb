class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.string :role
      t.string :company
      t.date :start
      t.date :end
      t.text :description
      t.string :stack

      t.timestamps
    end
  end
end
