class Competition < ApplicationRecord
  has_many :competing_teams
  has_many :teams, through: :competing_teams
end
