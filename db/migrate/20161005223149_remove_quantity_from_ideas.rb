class RemoveQuantityFromIdeas < ActiveRecord::Migration[5.0]
  def change
    remove_column :ideas, :quality 
  end
end
