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
