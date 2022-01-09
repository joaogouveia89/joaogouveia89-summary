class CreateAcademicFormations < ActiveRecord::Migration[6.1]
  def change
    create_table :academic_formations do |t|
      t.string :institution
      t.date :start
      t.date :end
      t.string :title

      t.timestamps
    end
  end
end
