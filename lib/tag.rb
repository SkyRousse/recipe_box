class Tag < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
    validates(:category, {:presence => true, :length => {:maximum => 40}})
    before_save(:capitalize_name)

  private

    define_method(:capitalize_name) do
      self.category=(category().capitalize())
    end
end
