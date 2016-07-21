require('spec_helper')

describe(Tag) do
  it("validates the presence of a category for a tag") do
    tag = Tag.new({:category => ""})
    expect(tag.save()).to(eq(false))
  end
end
