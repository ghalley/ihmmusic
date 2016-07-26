class Post < ActiveRecord::Base
  include Authority::Abilities
  self.per_page = 10
end
