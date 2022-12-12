class Subject < ApplicationRecord
  searchkick
  
  has_many :questions
    #kaminari
    paginates_per 50
end
