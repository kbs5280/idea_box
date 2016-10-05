class AddQualityToIdeas < ActiveRecord::Migration[5.0]
  def change
    add_column :ideas, :quality, :string, default: 'swill'
  end
end
