class Hero < ApplicationRecord
  has_many :herro_powers
  has_many :powers, through :hero_powers

end
