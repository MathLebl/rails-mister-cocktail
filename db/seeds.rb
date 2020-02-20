require 'open-uri'
require 'json'

def seed_ingredients
  url = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
  response = JSON.parse(url)
  response.each do |ingredient|
    ingredient[1].each do |pair|
      Ingredient.create(name: pair['strIngredient1'])
    end
  end
end
seed_ingredients
