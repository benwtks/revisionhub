class AddFirstNameToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :first_name, :string
  end
end
