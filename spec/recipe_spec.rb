require('spec_helper')

describe(Recipe) do
  it("validates the presenve of a name for a recipe") do
    recipe = Recipe.new({:name => ""})
    expect(recipe.save()).to(eq(false))
  end

end
