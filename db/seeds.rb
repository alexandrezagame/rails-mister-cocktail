
require 'open-uri'
require 'json'
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredient_serialized = open(url).read
parsed_ingredients = JSON.parse(ingredient_serialized)
array_of_ingredients = parsed_ingredients['drinks']
array_of_ingredients.each do |ingredient_hash|
ingredient = Ingredient.new(
  name: ingredient_hash['strIngredient1']
  )
ingredient.save!
end
