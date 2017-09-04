class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades, id: :uuid do |t|
      t.string :grade
      t.integer :percentage
      t.date :date

      t.timestamps
    end
  end
end
