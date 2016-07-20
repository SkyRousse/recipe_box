require('spec_helper')

describe('create a recipe route', {:type => :feature}) do
  it('creates a recipe and brings user to page where they can edit the recipe') do
    visit('/')
    fill_in("name", :with => "Ballsagna")
    click_button('Add Recipe')
    expect(page).to have_content('Ballsagna')
  end
end
