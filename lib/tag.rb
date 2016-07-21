class Tag < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
    validates(:category, {:presence => true, :length => {:maximum => 40}})
    before_save(:upcase_name)

  private

    define_method(:upcase_name) do
      self.category=(category().upcase())
    end
end
