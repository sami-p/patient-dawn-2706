require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it {should have_many(:competing_teams)}
    it {should have_many(:competitions).through(:competing_teams)}
    it {should have_many(:players)}
  end

  describe 'class methods' do
    it 'calculates the average age of all teams players' do
      competition = Competition.create!(name: "The Goodest Boy", location: "Ministry of Magic", sport: "Ice Skating For Dogs")

      team_1 = competition.teams.create!(nickname: "Anything Is Pawsible", hometown: "Boston")
      team_2 = competition.teams.create!(nickname: "The Ultimutt Homies", hometown: "Aspen")
      team_3 = competition.teams.create!(nickname: "Pug Life", hometown: "Wheaton")
      team_4 = competition.teams.create!(nickname: "Bad To The Bone", hometown: "Dallas")

      player_1 = team_1.players.create!(name: "Rocky", age: 7)
      player_2 = team_1.players.create!(name: "Fido", age: 2)
      player_3 = team_2.players.create!(name: "Champ", age: 3)
      player_4 = team_2.players.create!(name: "Duke", age: 17)
      player_5 = team_3.players.create!(name: "Coop", age: 8)
      player_6 = team_3.players.create!(name: "Jet", age: 10)
      player_7 = team_4.players.create!(name: "Gerty", age: 5)
      player_8 = team_4.players.create!(name: "Rosie", age: 11)

      expect(competition.teams.average_age).to eq(7.88)
    end
  end
end
