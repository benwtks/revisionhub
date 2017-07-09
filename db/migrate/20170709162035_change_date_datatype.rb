class ChangeDateDatatype < ActiveRecord::Migration[5.0]
  def change
    change_column :sessions, :date, :date
  end
end
