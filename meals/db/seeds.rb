# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Recipe.count == 0
  puts "Adding coddle"
  recipe = Recipe.create({ name: 'Coddle' , description: 'The loveliest meal to come out of Dublin' })
end

if Ingredient.count == 0
  puts "Adding sausages nom nom nom"
  Ingredient.create({ name: 'Sausage' })
  puts "Adding potatoes"
  Ingredient.create({ name: 'Potatoes' })
  puts "Adding carrots"
  Ingredient.create({ name: 'Carrots' })
  puts "Adding rashers"
  Ingredient.create({ name: 'Rashers' })
  puts "Adding onion"
  Ingredient.create({ name: 'Onion' })
  puts "Adding parsley"
  Ingredient.create({ name: 'Parsley' })
end

if RecipeIngredient.count == 0
  puts "Adding relations"
  Ingredient.find_each do |ingredient|
    RecipeIngredient.create({ recipe_id: 1 , ingredient_id: ingredient.id, quantity: 1 })
  end
end
