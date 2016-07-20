require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

get('/') do
  erb(:index)
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch('id').to_i())
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
