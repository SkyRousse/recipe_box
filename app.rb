require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}


# Create
#
# # To add a new ingredient to the list of existing ingredients:
# recipe.ingredients.push(new_ingredient)
#
# # To create a new recipe and associate them with a ingredient at the same time:
# Recipe.new({:ingredient_ids => [ingredient1.id()]})
#
# # to create a recipe through the ingredient:
# ingredient1.recipes.new()
#
# Read
#
# to see which recipes an ingredient is inside (use for filtering)
#
# ingredient.recipes()
#
# Update
#
# to update ALL of a recipe's ingredients or ingredients' recipes
#
# recipe.update({:ingredient_ids => [ingredient1.id()]})
#
# Delete
#
# to remove an ingredient from a recipe
#
# recipe.ingredients.destroy(ingredient)
