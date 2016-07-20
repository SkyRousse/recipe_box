require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

get('/') do
  erb(:index)
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch('id').to_i())
  @ingredient
  @ingredients = Ingredient.all()
  erb(:recipe)
end

post('/ingredients') do
  recipe_id = params.fetch('recipe_id')
  @recipe = Recipe.find(recipe_id)
  ingredient = params.fetch('ingredient')
  @ingredients = Ingredient.all()
  @ingredient = @recipe.ingredients.new(:id => nil, :ingredient => ingredient)
  erb(:recipe)
end

post('/recipes') do
  name = params.fetch('name')
  @recipe = Recipe.new(:id => nil, :name => name)
  if @recipe.save()
    redirect('/recipes/'.concat(@recipe.id().to_s()))
  else
    erb(:index)
  end
end

get('/recipes') do
  @recipes = Recipe.all()
  erb(:recipes)
end
