class AddHashIdToSubjects < ActiveRecord::Migration[5.0]
  def change
    add_column :subjects, :hashid, :string
    add_index :subjects, :hashid, unique: true
  end
end
