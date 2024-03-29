class ChangePrimaryKeyToUuidForSessions < ActiveRecord::Migration[5.0]
  def change
    add_column :sessions, :uuid, :uuid, default: "uuid_generate_v4()", null: false

    change_table :sessions do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    execute "ALTER TABLE sessions ADD PRIMARY KEY (id);"
  end
end
