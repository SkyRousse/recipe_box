class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  validates(:name, {:presence => true, :length => {:maximum => 40}})
  before_save(:upcase_name)

private

  define_method(:upcase_name) do
    self.name=(name().upcase())
  end
end
