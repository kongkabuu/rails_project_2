class Power < ApplicationRecord
  validates :description,presense: true, length:{minimum: 20}
  has_many :hero_powers
  has_many :heros, through :hero_powers
end
