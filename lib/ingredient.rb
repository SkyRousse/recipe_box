class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates(:ingredient, {:presence => true, :length => { :maximum => 40 }})
  before_save(:capitalize_ingredient)

private

  define_method(:capitalize_ingredient) do
    self.ingredient().capitalize!
  end
end
