require('spec_helper')

describe('create a recipe route', {:type => :feature}) do
  it('creates a recipe and brings user to page where they can edit the recipe') do
    visit('/')
    click_button('Add Recipe')
    expect(page).to have_content('NEW RECIPE')
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

describe('updates the NEW RECIPE default recipe with a value the user inputs', {:type => :feature}) do
  it('allows the user to update a recipe name') do
    visit('/')
    click_button('Add Recipe')
    fill_in("recipe_name", :with => "yew-ahr-eye crud")
    click_button("Name")
    expect(page).to have_content("YEW-AHR-EYE CRUD")
  end
end

describe('delete recipe path', {:type => :feature}) do
  it('allows the user to delete a recipe') do
    visit('/')
    click_button('Add Recipe')
    click_button("Delete Recipe")
    expect(page).to have_content("Add Recipe")
  end
end
