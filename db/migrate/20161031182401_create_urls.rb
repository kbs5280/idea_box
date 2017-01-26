class CreateUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :urls do |t|
      t.string :title
      t.string :URL
      t.boolean :read
      t.string :default
      t.string :false

      t.timestamps
    end
  end
end
