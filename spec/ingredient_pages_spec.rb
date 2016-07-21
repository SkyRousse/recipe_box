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
    fill_in("ingredient", :with => "debugger")
    click_button('Add Ingredient')
    expect(page).to have_content("Debugger")
    click_button('X')
    expect(page).to have_content("There are no ingredients")
  end
end
