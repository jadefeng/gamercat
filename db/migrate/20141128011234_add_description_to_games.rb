class AddDescriptionToGames < ActiveRecord::Migration
  def change
    add_column :games, :description, :text
    add_column :games, :image, :string
  end
end
