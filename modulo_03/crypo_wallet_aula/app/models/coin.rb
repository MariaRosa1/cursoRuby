class Coin < ApplicationRecord
    validates :description, presence: true
end
