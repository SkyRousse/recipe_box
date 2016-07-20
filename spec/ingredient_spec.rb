require('spec_helper')

describe(Ingredient) do
  it('validate the presence of a ingredient') do
    ingredient = Ingredient.new({:ingredient => ""})
    expect(ingredient.save()).to(eq(false))
  end
end
