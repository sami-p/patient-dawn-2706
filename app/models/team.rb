class Team < ApplicationRecord
  has_many :competing_teams
  has_many (:competitions), through: :competing_teams
  has_many :players
end
