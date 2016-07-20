require('spec_helper')

describe('create a recipe route', {:type => :feature}) do
  it('creates a recipe and brings user to page where they can edit the recipe') do
    visit('/')
    fill_in("name", :with => "Ballsagna")
    click_button('Add Recipe')
    expect(page).to have_content('BALLSAGNA')
  end
end

describe('views a recipes route', {:type => :feature}) do
  it('brings the user to a page where the user can see all the recipes listed') do
    test_recipe = Recipe.create({:name => "Yrea"})
    visit('/')
    click_link('See All Recipes')
    expect(page).to have_content('YREA')
  end
end

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
