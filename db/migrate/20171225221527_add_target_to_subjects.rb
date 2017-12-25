class AddTargetToSubjects < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :target, :integer
  end
end
