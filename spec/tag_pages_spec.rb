require('spec_helper')

describe('add a category route', {:type => :feature}) do
  it('allows a user to see a List of categories') do
    visit('/')
    test_category = Tag.create({:category => "Branches"})
    click_link('Filter Recipes by Category')
    expect(page).to have_content("Branches")
  end
end
