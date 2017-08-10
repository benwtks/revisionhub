class ChangeTopicsPrimaryKey < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :uuid, :uuid, default: "uuid_generate_v4()", null: false

    change_table :topics do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    execute "ALTER TABLE topics ADD PRIMARY KEY (id);"
  end
end
