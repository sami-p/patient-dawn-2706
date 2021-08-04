class Team < ApplicationRecord
  has_many :competing_teams
  has_many (:competitions), through: :competing_teams
  has_many :players

  def self.average_age
    joins(:players).average(:age).round(2)
  end
end
