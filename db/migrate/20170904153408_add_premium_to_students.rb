class AddPremiumToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :premium, :boolean, default: false
  end
end
