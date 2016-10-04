class DropTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :ideas
    drop_table :users
    drop_table :images
    drop_table :categories
  end
end
