class RemoveDescriptionFromIngredient < ActiveRecord::Migration
  def change
    remove_column :ingredients, :description, :string
  end
end
