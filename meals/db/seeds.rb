Ingredient.create!([
  {name: "Sausage"},
  {name: "Potatoes"},
  {name: "Carrots"},
  {name: "Rashers"},
  {name: "Onion"},
  {name: "Parsley"},
  {name: "Tomatos"},
  {name: "Pasta"},
  {name: "Mince"},
  {name: "Garlic"},
  {name: "Carrot"},
  {name: "Wine"},
  {name: "Rice"},
  {name: "Chilli"}
])
Recipe.create!([
  {name: "Coddle", description: "The loveliest meal to come out of Dublin"},
  {name: "Pasta Bolognese", description: "Meaty and a-saucey, just-a like a mamma used to make!"},
  {name: "Chilli Con Carne", description: "As hot and as fiery as you like it! ;)"}
])
RecipeIngredient.create!([
  {recipe_id: 1, ingredient_id: 1, quantity: 1},
  {recipe_id: 1, ingredient_id: 2, quantity: 1},
  {recipe_id: 1, ingredient_id: 3, quantity: 1},
  {recipe_id: 1, ingredient_id: 4, quantity: 1},
  {recipe_id: 1, ingredient_id: 5, quantity: 1},
  {recipe_id: 1, ingredient_id: 6, quantity: 1},
  {recipe_id: 2, ingredient_id: 7, quantity: 6},
  {recipe_id: 2, ingredient_id: 8, quantity: 1000},
  {recipe_id: 2, ingredient_id: 9, quantity: 500},
  {recipe_id: 2, ingredient_id: 5, quantity: 3},
  {recipe_id: 2, ingredient_id: 10, quantity: 3},
  {recipe_id: 2, ingredient_id: 11, quantity: 4},
  {recipe_id: 2, ingredient_id: 12, quantity: 350},
  {recipe_id: 3, ingredient_id: 7, quantity: 6},
  {recipe_id: 3, ingredient_id: 13, quantity: 1000},
  {recipe_id: 3, ingredient_id: 9, quantity: 500},
  {recipe_id: 3, ingredient_id: 5, quantity: 3},
  {recipe_id: 3, ingredient_id: 10, quantity: 3},
  {recipe_id: 3, ingredient_id: 11, quantity: 4},
  {recipe_id: 3, ingredient_id: 14, quantity: 4}
])
