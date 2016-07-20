require('spec_helper')

describe(Recipe) do
  it("validates the presenve of a name for a recipe") do
    recipe = Recipe.new({:name => ""})
    expect(recipe.save()).to(eq(false))
  end
  it("ensures the length of a recipe is at most 40 characters") do
    recipe = Recipe.new({:name => "a".*(41)})
    expect(recipe.save()).to(eq(false))
  end

end
