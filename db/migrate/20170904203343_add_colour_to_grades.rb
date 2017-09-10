class AddColourToGrades < ActiveRecord::Migration[5.0]
  def change
    add_column :grades, :colour, :string
  end
end
