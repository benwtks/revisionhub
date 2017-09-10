class DropTagColours < ActiveRecord::Migration[5.0]
  def change
    drop_table :tag_colours
  end
end
