class RemoveHashIdFromSubjects < ActiveRecord::Migration[5.0]
  def change
    remove_index :subjects, :hashid
    remove_column :subjects, :hashid, :string
  end
end
