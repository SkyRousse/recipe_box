require('spec_helper')

describe('add ingredient route', {:type => :feature}) do
  it('allows user to add an ingredient to a specific recipe') do
    visit('/')
    test_recipe = Recipe.create({:name => "Stabby Lambda"})
    click_link('See All Recipes')
    click_link('STABBY LAMBDA')
    fill_in("ingredient", :with => "rocky mountain oyster")
    click_button('Add Ingredient')
    expect(page).to have_content("Rocky mountain oyster")
  end
end

describe('add delete ingredient route', {:type => :feature}) do
  it('allows a user to delete an ingredient for a specific recipe') do
    visit('/')
    click_button('Add Recipe')
    fill_in("ingredient", :with => "gui debugger")
    click_button('Add Ingredient')
    expect(page).to have_content("Gui debugger")
    click_button('X')
    expect(page).to have_content("There are no ingredients")
  end
end

describe('add an ingredient route', {:type => :feature}) do
  it('allows a user to view a list of all the ingredients for all recipes') do
    visit('/')
    test_ingredient = Ingredient.create({:ingredient => "fixnums"})
    click_link("Filter Recipes by Ingredient")
    expect(page).to have_content("Fixnums")
  end
end
