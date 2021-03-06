require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

get('/') do
  erb(:index)
end

get('/recipes') do
  @recipes = Recipe.all()
  erb(:recipes)
end

get('/ingredients') do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

get('/tags') do
  @tags = Tag.all()
  erb(:categories)
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

post('/ingredients') do
  recipe_id = params.fetch('recipe_id')
  @recipe = Recipe.find(recipe_id)
  ingredient = params.fetch('ingredient')
  @ingredient = @recipe.ingredients.new({:ingredient => ingredient})
  @recipe.ingredients.push(@ingredient)
  redirect('/recipes/'.concat(@recipe.id().to_s()))
  erb(:recipes)
end

post('/tags') do
  recipe_id = params.fetch('recipe_id')
  @recipe = Recipe.find(recipe_id)
  category = params.fetch('category')
  @tag = @recipe.tags.new({:category => category})
  @recipe.tags.push(@tag)
  redirect('/recipes/'.concat(@recipe.id().to_s()))
  erb(:recipes)
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch('id').to_i())
  @ingredients = @recipe.ingredients()
  @tags = @recipe.tags()
  erb(:recipe)
end

get('/ingredients/:id') do
  @ingredient = Ingredient.find(params.fetch('id').to_i())
  @recipes = Recipe.all()
  erb(:ingredient)
end


patch('/recipes/:id') do
  recipe_id = params.fetch('id').to_i()
  @recipe = Recipe.find(recipe_id)
  name = params.fetch('recipe_name')
  if @recipe.update(:name => name)
    redirect('/recipes/'.concat(@recipe.id().to_s()))
  else
    erb(:recipes)
  end
end

delete('/recipes/:id') do
  recipe_id = params.fetch('id').to_i()
  @recipe = Recipe.find(recipe_id)
  @recipe.destroy()
  redirect('/')
  erb(:index)
end

delete('/ingredients/:id') do
  recipe_id = params.fetch('recipe_id')
  @recipe = Recipe.find(recipe_id)
  ingredient_id = params.fetch('id').to_i
  @ingredient = Ingredient.find(ingredient_id)
  @recipe.ingredients.destroy(@ingredient)
  redirect('/recipes/'.concat(@recipe.id().to_s()))
end
